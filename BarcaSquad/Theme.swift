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
//THEME
    static func apply(to window: UIWindow) {

        //Request a list of fonts available to determine the name of custom fonts
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }

        window.tintColor = Colours.garnet

        //let tabBar = UITabBar.appearance()

        let navBar = UINavigationBar.appearance()
        navBar.prefersLargeTitles = true
//        navBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Arial", size: 20)!]

    }

    struct Colours {
        static var garnet = UIColor(hue: 0.93, saturation: 1.00, brightness: 0.65, alpha: 1.00)
        static var blue = UIColor(hue: 0.58, saturation: 1.00, brightness: 0.60, alpha: 1.00)
    }

}
