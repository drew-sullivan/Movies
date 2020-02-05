//
//  MovieDataSource.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import UIKit

class MovieDataSource: NSObject, UICollectionViewDataSource {

    var moviesBySection = [MovieSection]() {
        didSet {
            if self.moviesBySection.count == MovieListType.allCases.count {
                self.moviesBySection = self.moviesBySection.sorted { $0 < $1 }
            }
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
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

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader {
            sectionHeader.sectionTitle.text = moviesBySection[indexPath.section].name.rawValue
            return sectionHeader
        }
        return UICollectionReusableView()
    }

}
