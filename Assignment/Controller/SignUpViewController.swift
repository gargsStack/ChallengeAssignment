//
//  SignUpViewController.swift
//  Assignment
//
//  Created by Vivek on 06/06/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit
import CoreData


fileprivate let genderList = ["Male", "Female", "Other"]

class SignUpViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //-------------
    let genderPicker = UIPickerView()
    //    lazy var newUser = User()
    
    let managedContext = CoreDataManager.shared.persistentContainer.viewContext
    
    //MARK:-  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        genderPicker.delegate = self
        genderTextField.inputView = genderPicker
        
    }
    
    //MARK:-  Button actions
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        if validateRequiredField() {
            self.registerNewUser()
        }else{
            debugPrint("User details are not correct")
        }
    }
    
    @IBAction func gotoLoginView(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
     //MARK:-  Custom method
    
    private func validateRequiredField() -> Bool {
        
        let email = emailTextField.text
        let password = passwordTextField.text
        let gender = genderTextField.text
        let mobile = mobileNumberTextField.text
        
        if email != "", password != "", gender != "", mobile != "" {
            
            if email!.isValidEmail() {
                
                if let _ = User.findUser(withEmail: email!) {
                    showError(withMessage: "User already exists")
                    return false
                }
                if password!.isValidPassword() {
                    if mobile!.isValidMobileNumber() {
                        return true
                    }else{
                        showError(withMessage: "Mobile number is not valid")
                        return false
                    }
                }else{
                    showError(withMessage: "Password should contain one special character and minimum 8 characters required")
                    return false
                }
            }
            showError(withMessage: "Email is not vaild.")
            return false
        }else{
            showError(withMessage: "Please complete the form.")
            return false
        }
    }
    
    func showError(withMessage text: String){
        AlertMessage.show(onController: self, withTitle: "Error", withMessage: text)
    }

    
    func registerNewUser() {

        var userDict = [String:String]()
        
        userDict[UserKey.FirstName.rawValue] = firstNameTextField.text
        userDict[UserKey.LastName.rawValue] = lastNameTextField.text
        userDict[UserKey.Email.rawValue] = emailTextField.text!
        userDict[UserKey.Password.rawValue] = passwordTextField.text!
        userDict[UserKey.Mobile.rawValue] = mobileNumberTextField.text!
        userDict[UserKey.Gender.rawValue] = genderTextField.text!
                
        let _ = User.create(dict: userDict)
        if CoreDataManager.shared.saveContext() {
            debugPrint("User saved")
            self.navigationController?.popViewController(animated: true)
        }else{
            debugPrint("User not saved ")
        }
    }
}

// MARK:- UIPickerView Delegates

extension  SignUpViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderList.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderList[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        genderTextField.text = genderList[row]
    }
}

//// MARK:- UITextField Delegates
//
//extension SignUpViewController: UITextFieldDelegate {
//    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == emailTextField {
//            let email = textField.text
//            if !email!.isValidEmail() {
//                showError(withMessage: "Email is not vaild.")
//            }
//        }else if textField == passwordTextField {
//            let password = passwordTextField.text
//            if !password!.isValidPassword() {
//                showError(withMessage: "Password should contain one special character and minimum 8 characters required")
//            }
//        }else if textField == mobileNumberTextField {
//            let mobile = mobileNumberTextField.text
//            if !mobile!.isValidMobileNumber() {
//                showError(withMessage: "Mobile number is not valid")
//            }
//        }
//        textField.becomeFirstResponder()
//    }
//    
//}





