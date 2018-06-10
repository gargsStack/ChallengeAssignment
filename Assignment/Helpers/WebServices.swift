//
//  NetworkManager.swift
//  Assignment
//
//  Created by Vivek on 06/06/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import Foundation

class WebServices: NSObject {
    
    static let shared = WebServices()
    private override init() {}
    
    
    func fetchImageFromServer( _ successBlock:@escaping ( _ response: [String:Any] )->Void , errorBlock: @escaping (_ error: Error) -> Void ){
        let url = URL(string: "http://abaltamimi.com/apis/galleryCat.php")
        
        let task = URLSession.shared.dataTask(with: url!) {( data, response, error) in
            
            guard error == nil  else {
                debugPrint(error?.localizedDescription ?? "Error")
                errorBlock(error!)
                return
            }
            guard let content = data else {
                debugPrint("No data")
                return
            }
            guard let json = try?JSONSerialization.jsonObject(with: content, options: .mutableContainers) as? [String:Any] else {
                debugPrint("Not containing JSON")
                return
            }
            debugPrint(json)
            successBlock(json!)
        }
        task.resume()
    }
    
    
}

