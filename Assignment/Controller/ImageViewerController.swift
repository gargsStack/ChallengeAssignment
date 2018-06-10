//
//  ImageViewerController.swift
//  Assignment
//
//  Created by Vivek on 06/06/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit
import IDMPhotoBrowser


class ImageViewerController: UIViewController {
    
    // IBOutlet
    @IBOutlet var imageCollectionView: UICollectionView!
    
    // Varibale
    var itemsImage = [Image]()
    
    //MARK:- View's Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        methodToFetchImages()
        
        // Do any additional setup after loading the view.
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        self.view.addGestureRecognizer(gesture)
    }
    
    //MARK:- Selector method
    
    @objc func showFullImage(sender: UIButton){
        var photos = [IDMPhoto]()
        
        for item in itemsImage {
            let imgUrl  = URL(string: item.imgUrl!)
            let idmPhotoItem = IDMPhoto(url: imgUrl!)
            photos.append(idmPhotoItem!)
        }
        
        let browser = IDMPhotoBrowser(photos: photos)
        browser?.delegate = self
        browser?.displayCounterLabel = false
        browser?.useWhiteBackgroundColor = false
        browser?.displayActionButton = false
        browser?.leftArrowImage =  UIImage(named: "IDMPhotoBrowser_customArrowLeft.png")
        browser?.rightArrowImage =  UIImage(named: "IDMPhotoBrowser_customArrowRight.png")
        browser?.doneButtonImage =  UIImage(named: "IDMPhotoBrowser_customDoneButton.png")
        browser?.leftArrowSelectedImage =  UIImage(named: "DMPhotoBrowser_customArrowLeftSelected.png")
        browser?.rightArrowSelectedImage =  UIImage(named: "IDMPhotoBrowser_customArrowRightSelected.png")
        browser?.view.tintColor = .white
        browser?.progressTintColor = .white
        browser?.trackTintColor = UIColor(white: 0.8, alpha: 1.0)
        browser?.setInitialPageIndex(UInt(sender.tag))
        
        self.present(browser!, animated: true, completion: nil)

    }
    

    @objc func panGesture(sender: UIPanGestureRecognizer){
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Custom
    func methodToFetchImages()  {
        ActivityIndicator.shared.startLoader(view: self.view)
        
        WebServices.shared.fetchImageFromServer( {(json) in
            print(json)
            let status = json["status"] as! String
            if status == "success" {
                
                if let images = json["data"] as? [[String:Any]] {
                    
                    let itemsImage  = images.map({ (info) -> Image in
                        Image.init(withJson: info)
                    })
                    self.itemsImage = itemsImage
                    DispatchQueue.main.async {
                        self.imageCollectionView.reloadData()
                        ActivityIndicator.shared.stopLoader()
                    }
                }
            }else{
                AlertMessage.show(onController: self, withTitle: "Error", withMessage:"Somthing went wrong")
            }
        }) { (error) in
            print(error)
            ActivityIndicator.shared.stopLoader()
        }
    }

    
    //MARK:- Button action
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: UICollectionViewDataSource

extension ImageViewerController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsImage.count;
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ImageCell
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(self.showFullImage(sender:)), for: .touchUpInside)
        // Use the outlet in our custom class to get a reference to the UILabel in the cell

        let thumbUrlString = itemsImage[indexPath.row].thumbUrl
        let thumbUrl:URL = URL(string: thumbUrlString!)!

        // Start background thread so that image loading does not make app unresponsive
        DispatchQueue.global(qos: .userInitiated).async {
            let imageData:NSData = NSData(contentsOf: thumbUrl)!
            // When from background thread, UI needs to be updated on main_queue
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                cell.imageView.image = image
            }
        }
        return cell
    }

}


extension ImageViewerController: IDMPhotoBrowserDelegate {
    func photoBrowser(_ photoBrowser: IDMPhotoBrowser!, didShowPhotoAt index: UInt) {
        
    }
    
}

