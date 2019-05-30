//
//  Theme.swift
//  BarcaSquad
//
//  Created by Tianna Henry-Lewis on 2019-05-30.
//  Copyright © 2019 Tianna Henry-Lewis. All rights reserved.
//

import Foundation
import UIKit

struct Theme {

    static func apply(to window: UIWindow) {
        window.tintColor = Colours.garnet

        let tabBar = UITabBar.appearance()
        tabBar.barTintColor = Colours.blue

    
    }

    struct Colours {
        static var garnet = UIColor(hue: 0.93, saturation: 1.00, brightness: 0.65, alpha: 1.00)
        static var blue = UIColor(hue: 0.58, saturation: 1.00, brightness: 0.60, alpha: 1.00)
    }

}
