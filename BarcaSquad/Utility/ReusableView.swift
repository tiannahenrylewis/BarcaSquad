//
//  ReusableView.swift
//  BarcaSquad
//
//  Created by Tianna Henry-Lewis on 2019-05-30.
//  Copyright © 2019 Tianna Henry-Lewis. All rights reserved.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier : String { get }
}

extension ReusableView {
    static var reuseIdentifier : String {
        return String(describing: self)
    }
}

extension UITableViewCell : ReusableView { }
