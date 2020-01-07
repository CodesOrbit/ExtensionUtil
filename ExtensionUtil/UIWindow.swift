//
//  UIWindow.swift
//  ExtensionUtil
//
//  Created by Umair Afzal on 15/04/2019.
//  Copyright © 2019 CodesOrbit. All rights reserved.
//

import Foundation
import UIKit

public extension UIWindow {
    
    /**
     Replaces the root viewcontroller
     
     - Parameters:
         - viewController: ViewController with which root viewController is to be replaced.
         - animated: Should the replacement be animated.
         - completion: Completion block to be executed after the controller replacement.
    */
    
    
    func replaceRootViewControllerWith(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        let snapshotImageView = UIImageView(image: self.snapshot())
        self.addSubview(snapshotImageView)
        
        let dismissCompletion = { () -> Void in // dismiss all modal view controllers
            self.rootViewController = viewController
            self.bringSubviewToFront(snapshotImageView)
            
            if animated {
                
                UIView.animate(withDuration: 0.4, animations: { () -> Void in
                    snapshotImageView.alpha = 0
                }, completion: { (success) -> Void in
                    snapshotImageView.removeFromSuperview()
                    completion?()
                })
                
            } else {
                snapshotImageView.removeFromSuperview()
                completion?()
            }
        }
        
        if self.rootViewController!.presentedViewController != nil {
            self.rootViewController!.dismiss(animated: false, completion: dismissCompletion)
            
        } else {
            dismissCompletion()
        }
    }
    
    /**
     Get the top most view controller i.e. the one that is currently visible on screen.
     
     - Returns: Top most view controller of type  **UIViewController**
    */
    
    func topMostViewController() -> UIViewController? {
        return self.window?.rootViewController?.topMostViewController()
    }
}
