//
//  UIAlertController+errorWarning.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import UIKit

extension UIAlertController {

    static func errorWarning(given error: Error) -> UIAlertController {
        let alertController = UIAlertController(title: "Error:", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        return alertController
    }

}
