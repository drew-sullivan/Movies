//
//  SectionHeader.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Allegion, LLC. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {

    @IBOutlet weak var sectionTitle: UILabel!

    func config(_ indexPath: IndexPath) {
        sectionTitle.textColor = .black
    }
    
}
