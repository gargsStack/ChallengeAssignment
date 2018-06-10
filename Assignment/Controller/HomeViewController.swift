//
//  HomeViewController.swift
//  Assignment
//
//  Created by Vivek on 06/06/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit
import  CoreData

class HomeViewController: UIViewController {
    
    //IBOutlet
    @IBOutlet var firstNameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var mobileNumberLabel: UILabel!
    
    // Variables
    var emailID: String?
    var currentUser: User?
    let managedContext = CoreDataManager.shared.persistentContainer.viewContext
    
    
    //MARK:- View's Lifecyce
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(tapgesture)
        // Do any additional setup after loading the view.
        
        getUserDetailsDisplay()
        // update tu UI
        
    }
    
    //MARK:- Selector
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    //MARK:- Custom method
    func getUserDetailsDisplay(){
        
        if let currentUser = User.findUser(withEmail: emailID!) {
            self.currentUser = currentUser
            updateUIWith()
        }else{
            AlertMessage.show(onController: self, withTitle: "Error", withMessage: "User not found")
        }
        
    }
    
    func updateUIWith() {
        self.firstNameLabel.text = currentUser?.firstName
        self.lastNameLabel.text = currentUser?.lastName
        self.mobileNumberLabel.text = currentUser?.mobile
        
    }
    
    func updateUserWithMobileNumber(number: String) {
        
        currentUser?.update(mobileNumber: number, forUser: currentUser!)
        if  CoreDataManager.shared.saveContext(){
            getUserDetailsDisplay()
            AlertMessage.show(onController: self, withTitle: "Succes", withMessage: "Mobile number updated")
        }else{
            AlertMessage.show(onController: self, withTitle: "Error", withMessage: "User not update")
        }
    }
    
    //MARK:- Button action
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        // log out user
        UserDefaults.standard.removeObject(forKey: "userEmail")
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginView = storyBoard.instantiateViewController(withIdentifier: "loginVIew") as! LoginViewController
        let nav = UINavigationController(rootViewController: loginView)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = nav
    }
    
    @IBAction func editMobileNumberButtonTapped(_ sender: UIButton){
        let editAlert = UIAlertController(title: "Edit mobile number", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Done", style: .default) { (alertAction) in
            let textField = editAlert.textFields![0] as UITextField
            self.updateUserWithMobileNumber(number: textField.text!)
            
        }
        editAlert.addTextField { (textField) in
            textField.placeholder = "Enter newnumber"
        }
        editAlert.addAction(action)
        self.present(editAlert, animated: true, completion: nil)
    }
    
}

