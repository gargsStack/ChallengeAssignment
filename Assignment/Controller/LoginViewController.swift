//
//  LoginViewController.swift
//  Assignment
//
//  Created by Vivek on 06/06/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit
import CoreData


class LoginViewController: UIViewController {
    
    // OUtlets
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTexrField: UITextField!
    
    // Variables
    let managedContext = CoreDataManager.shared.persistentContainer.viewContext
    
    //MARK:-  View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func viewDidDisappear(_ animated: Bool){
        userNameTextField.text = ""
        passwordTexrField.text = ""
    }
    
  //MARK:-  Button action
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        let email = userNameTextField.text
        let password = passwordTexrField.text
        
        if validateRequiredFields(email: email!, password: password!) {
            let email = userNameTextField.text!
            let password = passwordTexrField.text!
            
            if let user = User.findUser(withEmail: email) {
                if user.password == password {
                    UserDefaults.standard.set(email, forKey: "userEmail")
                    self.gotoHomePage()
                }else{
                     showError(withMessage: "Password not correct")
                }
            }else{
                 showError(withMessage: "User not found")
            }
        }
    }
    
    //MARK:-  View Custom Method
    
    private func validateRequiredFields(email: String, password: String) -> Bool {
        
        if email != "" && password != "" {
            
            if email.isValidEmail() {
                if password.isValidPassword() {
                    return true
                }else{
                     showError(withMessage: "Password should contain one special character and minimum 8 characters required")
                    return false
                }
            }else{
                 showError(withMessage: "Email is not vaild.")
                return false
            }
            
        }else{
             showError(withMessage: "All field are required.")
            return false
        }
    }
    
    func gotoHomePage() {
        
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        if let homeView = storyBoard.instantiateViewController(withIdentifier: "HomeView") as? HomeViewController {
            homeView.emailID = userNameTextField.text!
            self.navigationController?.show(homeView, sender: nil)
        }
    }
    
    func showError(withMessage text: String){
        AlertMessage.show(onController: self, withTitle: "Error", withMessage: text)
    }
}

