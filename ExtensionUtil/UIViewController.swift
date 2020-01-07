//
//  UIVIewController.swift
//  ExtensionUtil
//
//  Created by Umair Afzal on 15/04/2019.
//  Copyright © 2019 CodesOrbit. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    /**
     Add Left nav button
     
     - Parameters:
         - image: Image for nav button
         - title: Title for nav button
         - action: Selector to be called on nav button tap
     
     - Returns: Instance of UITableViewCell with type <T>
    */
    
    func addCustomLeftNavButton(image:UIImage? = nil, title: String = "", action: Selector) {
        let button: UIButton = UIButton (type: UIButton.ButtonType.custom)
        button.tintColor = UIColor.black
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: UIControl.Event.touchUpInside)
        
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = barButton
    }
    
    /**
     Add Right nav button
     
     - Parameters:
         - image: Image for nav button
         - title: Title for nav button
         - action: Selector to be called on nav button tap
     
     - Returns: Instance of UITableViewCell with type <T>
    */
    
    func addCustomRightNavButton(image:UIImage? = nil, title: String = "", action: Selector) {
        let button: UIButton = UIButton (type: UIButton.ButtonType.custom)
        button.tintColor = UIColor.black
        button.setImage(image, for: .normal)
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: action, for: UIControl.Event.touchUpInside)
        
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
    }
    
    /**
     Get the top most view controller i.e. the one that is currently visible on screen.
     
     - Returns: Top most view controller of type  **UIViewController**
    */
    
    func topMostViewController() -> UIViewController {
        
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController!.topMostViewController()
        }
        
        if let tab = self as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        
        if self.presentedViewController == nil {
            return self
        }
        
        if let navigation = self.presentedViewController as? UINavigationController {
            return navigation.visibleViewController!.topMostViewController()
        }
        
        if let tab = self.presentedViewController as? UITabBarController {
            
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            
            return tab.topMostViewController()
        }
        
        return self.presentedViewController!.topMostViewController()
    }
    
    /**
     Set the view controller to dismiss on tap
     */
    
    func setDismissOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissViewControllerOnTap))
        tapGesture.delegate = self
        self.view.addGestureRecognizer(tapGesture)
        self.view.isUserInteractionEnabled = true
    }
    
    @objc func dismissViewControllerOnTap(gesture: UIGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /**
     Shows **UIAlertController** with a **OK** button and message.
     
     - Parameters:
         - _: Message to be shown
    */
    
    func showOkAlert(_ msg: String){
        let alert = UIAlertController(title:"", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    /**
     Shows **UIAlertController** with a **OK** button and message.
     
     - Parameters:
         - _: Message to be shown
         - okAction: Function to be called on **OK** button tap.
    */
    
    func showOkAlertWithOKCompletionHandler(_ msg: String, okAction: @escaping (UIAlertAction) -> Void){
        let alert = UIAlertController(title:"", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: okAction)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

extension UIViewController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
}

