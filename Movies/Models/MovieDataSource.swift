//
//  MovieDataSource.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Allegion, LLC. All rights reserved.
//

import UIKit

class MovieDataSource: NSObject, UICollectionViewDataSource {

    var moviesBySection = [MovieSection]()

    private func numberOfSections(in tableView: UITableView) -> Int {
        return moviesBySection.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if moviesBySection.isEmpty { return 0 }
        return moviesBySection[section].movies.count
    }

    func collectionView(_ collectionView: UICollectionView, titleForHeaderInSection section: Int) -> String {
        return moviesBySection[section].name.rawValue
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "MovieCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! MovieCell
        return cell
    }

}
