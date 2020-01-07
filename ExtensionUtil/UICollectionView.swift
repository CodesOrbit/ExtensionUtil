//
//  UICollectionViewExtension.swift
//  ExtensionUtil
//
//  Created by Umair Afzal on 29/08/2019.
//  Copyright © 2019 Bilal Saeed. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    /**
     Registers a cell with collectionview and returns a dequeued instance of that cell.
     
     - Parameters:
         - _: Type <T> of the collectionview cell being registered
         - indexPath: indexPath for which instance of cell is required.
     
     - Returns: Instance of UICollectionViewCell with type **<T>**
    */
    
    func register<T: UICollectionViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        self.register(UINib(nibName: String(describing: T.self), bundle: Bundle.main), forCellWithReuseIdentifier: String(describing: T.self))
        let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
        return cell
    }
}
