//
//  GradientView.swift
//  Assignment
//
//  Created by Vivek on 09/06/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit


//@IBDesignable class GradientView: UIView {
//
//    private var gradientLayer : CAGradientLayer!
//
//    @IBInspectable var topColor: UIColor = .red {
//        didSet {
//            setNeedsLayout()
//        }
//    }
//
//    @IBInspectable var middleColor: UIColor = .orange {
//        didSet {
//            setNeedsLayout()
//        }
//    }
//
//    @IBInspectable var bottomColor: UIColor = .gray {
//        didSet {
//            setNeedsLayout()
//        }
//    }
//
//    @IBInspectable var shadowColor: UIColor = .clear {
//        didSet {
//            setNeedsLayout()
//        }
//    }
//
//    @IBInspectable var startPointX: CGFloat = 0 {
//        didSet {
//            setNeedsLayout()
//        }
//    }
//
//    @IBInspectable var startPointY: CGFloat = 0.5 {
//        didSet {
//            setNeedsLayout()
//        }
//    }
//
//    @IBInspectable var endPointX: CGFloat = 1 {
//        didSet {
//            setNeedsLayout()
//        }
//    }
//
//    @IBInspectable var endPointY: CGFloat = 0.5 {
//        didSet {
//            setNeedsLayout()
//        }
//    }
//
//    @IBInspectable var cornerRadius: CGFloat = 0 {
//        didSet {
//            setNeedsLayout()
//        }
//    }
//
//    override class var layerClass:AnyClass {
//        return CAGradientLayer.self
//    }
//
//    override func layoutSubviews() {
//        self.gradientLayer = self.layer as! CAGradientLayer
//        self.gradientLayer.colors = [topColor.cgColor,middleColor.cgColor, bottomColor.cgColor]
//        self.gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
//        self.gradientLayer.endPoint  = CGPoint(x: endPointX, y: endPointY)
//        self.layer.cornerRadius = cornerRadius
//
//    }
//}



@IBDesignable

class GradientView: UIView {
    
    private var gradientLayer : CAGradientLayer!
    
    @IBInspectable var topColor: UIColor = .red {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable var midColor: UIColor = .orange {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable var bottomColor: UIColor = .white {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointX: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var startPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointX: CGFloat = 1 {
        didSet {
            setNeedsLayout()
        }
    }
    
    @IBInspectable var endPointY: CGFloat = 0.5 {
        didSet {
            setNeedsLayout()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        self.gradientLayer = (layer as! CAGradientLayer)
        self.gradientLayer.colors = [topColor.cgColor,midColor.cgColor, bottomColor.cgColor]
        self.gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        self.gradientLayer.endPoint  = CGPoint(x: endPointX, y: endPointY)
        
    }
}
















