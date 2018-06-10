//
//  Image.swift
//  Assignment
//
//  Created by Vivek on 06/06/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import Foundation
import UIKit

class Image: NSObject {
    
    var id: Int?
    var name: String?
    var thumbUrl: String?
    var imgUrl: String?
    
    
    override init() {
        super.init()
    }
    
    init(withJson dict: [String:Any]) {
        
        if let id = dict["id"] as? Int {
            self.id = id
        }
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let thumb = dict["thumb"] as? String {
            self.thumbUrl = thumb
        }
        if let image = dict["image"] as? String {
            self.imgUrl = image
        }
        
    }
    
}
