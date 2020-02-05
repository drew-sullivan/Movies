//
//  UICollectionView+UICollectionViewDelegateFlowLayout.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import UIKit

extension MovieViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.size.height
        let width = view.frame.size.width
        let padding = 5

        var numCellsInRow: Int
        var cellWidth: CGFloat
        let cellHeight: CGFloat
        if height > width {
            numCellsInRow = 2
        } else {
            numCellsInRow = 4
        }
        cellWidth = (width / CGFloat(numCellsInRow)) - CGFloat(padding)
        cellHeight = cellWidth * 3.5 / 2
        return CGSize(width: cellWidth, height: cellHeight)
    }

}
