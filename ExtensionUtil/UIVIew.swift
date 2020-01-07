//
//  UIVIew.swift
//  ExtensionUtil
//
//  Created by Umair Afzal on 15/04/2019.
//  Copyright © 2019 CodesOrbit. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    /**
     IBDesignable **Bool** if set to true for certain view the view renders as a circular view
     */
    
    @IBInspectable
    var isCirculer: Bool {
        
        get {
            return layer.cornerRadius == min(self.frame.width, self.frame.height) / CGFloat(2.0) ? true : false
        }
        
        set {
            
            if newValue {
                layer.cornerRadius = self.frame.height/2
                self.clipsToBounds = true
                
            } else {
                layer.cornerRadius = 0.0
                self.clipsToBounds = false
            }
        }
    }
    
    /**
     IBInspectable **CGFloat** for setting corner radius of a view
     */
    
    @IBInspectable
    var cornerRadius: CGFloat {
        
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    
    /**
     IBInspectable **CGFloat** for setting border width of a view
     */
    
    @IBInspectable
    var borderWidth: CGFloat {
        
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
    /**
    IBInspectable **UIColor** for setting border color of a view
    */
    
    @IBInspectable
    var borderColor: UIColor? {
        
        get {
            
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        
        set {
            
            if let color = newValue {
                layer.borderColor = color.cgColor
                
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    /**
    IBInspectable **CGFloat** for setting shadow radius of a view
    */
    
    @IBInspectable
    var shadowRadius: CGFloat {
        
        get {
            return layer.shadowRadius
        }
        
        set {
            layer.shadowRadius = newValue
        }
    }
    
    /**
    IBInspectable **Float** for setting shadow opacity of a view
    */
    
    @IBInspectable
    var shadowOpacity: Float {
        
        get {
            return layer.shadowOpacity
        }
        
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    /**
    IBInspectable **CGSize** for setting shadow size of a view
    */
    
    @IBInspectable
    var shadowOffset: CGSize {
        
        get {
            return layer.shadowOffset
        }
        
        set {
            layer.shadowOffset = newValue
        }
    }
    
    /**
    IBInspectable **UIColor** for setting shadow color of a view
    */
    
    @IBInspectable
    var shadowColor: UIColor? {
        
        get {
            
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        
        set {
            
            if let color = newValue {
                layer.shadowColor = color.cgColor
                
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    /**
     Add shadow to a **UIView**
     
     - Parameters:
         - offset: Shadow offset
         - color: Shadow color
         - opacity: Shadow opacity
         - radius: Shadow radius
         - cornerRadius: Corner radius for view (*optional default is set to 1.0*)
         - addBorder: If true a border is added to view (*optional default is set to false*)
         - borderColor: Border color for view (*optional default is set to UIColor.lightText*)
         - borderWidth: Border width for view (*optional default is set to 1.0*)
    */
    
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0, cornerRadius: CGFloat = 1.0, addBorder: Bool = false, borderColor: UIColor = UIColor.lightText, borderWidth: CGFloat = 1.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.cornerRadius = cornerRadius
        if addBorder {
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = borderWidth
        }
    }
    
    /**
     Add top border to a **UIView**
     
     - Parameters:
         - color: Border color
         - width: Border width
    */
    
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    /**
     Add right border to a **UIView**
     
     - Parameters:
         - color: Border color
         - width: Border width
    */
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    /**
     Add bottom border to a **UIView**
     
     - Parameters:
         - color: Border color
         - width: Border width
    */
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    /**
     Add left border to a **UIView**
     
     - Parameters:
         - color: Border color
         - width: Border width
    */
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    /**
     Add shadow to top or bottom of a  **UIView** as specified by **location** parameter
     
     - Parameters:
         - location: Location of enum type (*possible values `top` and `bottom`*)
         - offset: Shadow offset
         - color: Shadow color
         - opacity: Shadow opacity
         - radius: Shadow radius
    */
    
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        
        switch location {
            
        case .bottom:
            addShadow(offset: CGSize(width: 0, height: 10), color: color, opacity: opacity, radius: radius)
            
        case .top:
            addShadow(offset: CGSize(width: 0, height: -1.5), color: color, opacity: opacity, radius: radius)
        }
    }
    
    /**
     Add shadow to a **UIView**
     
     - Parameters:
         - offset: Shadow offset
         - color: Shadow color
         - opacity: Shadow opacity
         - radius: Shadow radius
    */
    
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    /**
     Get snapshot of a view
     
     - Returns: Snapshot of view of type **UIImage**
     */
    
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result!
    }
    
    /**
    Get view as a image i.e. a picture of view
    
    - Returns: Picture of view of type **UIImage**
    */
    
    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
    
    /**
     Round specific corner of a **UIView** as specified by **uiViewCorner** parameter
     
     - Parameters:
         - uiViewCorner: Location of enum type (*possible values `topLeft`, `topRight` , `bottomLeft` and `bottomRight`*)
         - radius: Corner radius
    */
    
    func roundCorner(uiViewCorner: UIViewCorners, radius: CGFloat = 5.0) {
        
        switch uiViewCorner {
            
        case .topLeft:
            let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners:[.topLeft], cornerRadii: CGSize.init(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            
        case .topRight:
            let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners:[.topRight], cornerRadii: CGSize.init(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            
        case .bottomLeft:
            let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners:[.bottomLeft], cornerRadii: CGSize.init(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            
        case .bottomRight:
            let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners:[.bottomRight], cornerRadii: CGSize.init(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
        }
    }
    
    /**
     Round top or bottom corners of a **UIView** as specified by **uiViewCorners** parameter
     
     - Parameters:
         - uiViewCorners: Location of enum type (*possible values `top` and `bottom`*)
         - radius: Corner radius
     
    */
    
    func roundCorners(uiViewCorners: VerticalLocation, radius: CGFloat = 5.0) {
        
        switch uiViewCorners {
            
        case .top:
            let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners:[.topLeft, .topRight], cornerRadii: CGSize.init(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            self.layoutIfNeeded()
            
        case .bottom:
            let maskPath = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners:[.bottomLeft, .bottomRight], cornerRadii: CGSize.init(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = maskPath.cgPath
            self.layer.mask = maskLayer
            self.layoutIfNeeded()
        }
    }
    
    /**
     Add border with rounded corners to a **UIView**
     
     - Parameters:
         - cornerRadius: Shadow offset
         - borderColor: Shadow color
         - borderWidth: Shadow opacity
    */
    
    
    func addBorderWithRoundCorners(cornerRadius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
    /**
     Add shadow to a **UIView**
     
     - Parameters:
         - color: Shadow color (*optional default is set to UIColor.black*)
         - opacity: Shadow opacity (*optional default is set to 0.5*)
         - offset: Shadow offset (*optional default is set to CGSize(width: -1, height: 1)*)
         - radius: Shadow radius (*optional default is set to 1.0*)
         - scale: If set to true then **layer rasterizationScale** is set to **UIScreen.main.scale** else 1 (*optional default is set to true*)
    */
    
    func dropShadow(color: UIColor = UIColor.black, opacity: Float = 0.5, offSet: CGSize = CGSize(width: -1, height: 1), radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    /**
     Hides the view
     */
    
    func hide() {
        self.isHidden = true
    }
    
    /**
    Shows the view
    */
    
    func show() {
        self.isHidden = false
    }
}
