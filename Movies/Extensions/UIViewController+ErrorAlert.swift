//
//  UIViewController+ErrorAlert.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Allegion, LLC. All rights reserved.
//

import UIKit

extension UIViewController {

    func notifyUser(of error: Error) {
        let okAlertController = UIAlertController.errorWarning(given: error)
        self.present(okAlertController, animated: true)
    }
    
}
