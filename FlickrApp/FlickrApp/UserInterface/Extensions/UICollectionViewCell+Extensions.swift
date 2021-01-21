//
//  UICollectionViewCell+Extensions.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import UIKit

extension UICollectionViewCell: CellIdentifierProtocol {
    static var identifier: String {
        return "\(String(describing: self))Identifier"
    }
}

extension UICollectionViewCell: NibNameProtocol {
    static var name: String {
        return "\(String(describing: self))"
    }
}
