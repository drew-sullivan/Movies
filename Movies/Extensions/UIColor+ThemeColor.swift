//
//  UIColor+ThemeColor.swift
//  Movies
//
//  Created by Drew Sullivan on 2/5/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import UIKit

extension UIColor {

    struct Theme {
        static let red = UIColor(red: 204, green: 29, blue: 45)
        static let orange = UIColor(red: 49, green: 168, blue: 72)
        static let blue = UIColor(red: 62, green: 47, blue: 130)
        static let green = UIColor(red: 248, green: 168, blue: 26)
    }

    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

}
