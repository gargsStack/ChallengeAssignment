//
//  AlertMessage.swift
//  Assignment
//
//  Created by Vivek on 06/06/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit

class AlertMessage: NSObject {
    
    class func show( onController controller: UIViewController, withTitle title: String?,  withMessage message: String?, withError error: NSError? = nil, onClose closeAction: (() -> Void)? = nil) {
        
        var msg: String?
        if let _ = error {
            msg = error?.localizedDescription
        } else {
            msg = message
        }
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel) { (_) in
            if let action = closeAction {
                action()
            }
        })
        controller.present(alert, animated: true, completion: nil)
    }
}
