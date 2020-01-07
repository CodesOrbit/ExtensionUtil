//
//  UITableViewExtension.swift
//  ExtensionUtil
//
//  Created by Umair Afzal on 8/25/19.
//  Copyright © 2019 Bilal Saeed. All rights reserved.
//

import UIKit

public extension UITableView {
    
    /**
     Registers a cell with tableview and returns a dequeued instance of that cell.
     
     - Parameters:
         - _: Type <T> of the tableview cell being registered
         - indexPath: indexPath for which instance of cell is required.
     
     - Returns: Instance of UITableViewCell with type <T>
    */
    
    func register<T: UITableViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        self.register(UINib(nibName: String(describing: T.self), bundle: .main), forCellReuseIdentifier: String(describing: T.self))
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
        return cell
    }
}
