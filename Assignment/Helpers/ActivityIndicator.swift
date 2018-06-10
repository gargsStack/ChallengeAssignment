//
//  Loader.swift
//  Assignment
//
//  Created by Vivek on 06/06/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit

public class ActivityIndicator {
    
    //Variable
    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    static var shared = ActivityIndicator()
    
    private func showProgressView(view: UIView) {
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor(hex: 0xffffff, alpha: 0.3)
        
        
        progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        progressView.center = view.center
        progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        // activityIndicator.center = CGPointMake(progressView.bounds.width / 2, progressView.bounds.height / 2)
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        view.addSubview(containerView)
        
        activityIndicator.startAnimating()
    }
    
    private func hideProgressView() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
    
    //-------------
    func startLoader(view:UIView){
        DispatchQueue.main.async(execute: {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            ActivityIndicator.shared.showProgressView(view: view);
        })
    }
    
    func stopLoader(){
        DispatchQueue.main.async(execute: {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            ActivityIndicator.shared.hideProgressView()
        })
    }
}




