//
//  MovieViewController+CollectionViewDelegate.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import UIKit

extension MovieViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let movie = movieDataSource.moviesBySection[indexPath.section].movies[indexPath.row]

        movieStore.fetchPosterImage(for: movie) { (imageResult) in

            guard let movieIndex = self.movieDataSource.moviesBySection[indexPath.section].movies.firstIndex(of: movie),
                case let .success(image) = imageResult else { return }

            let movieIndexPath = IndexPath(item: movieIndex, section: indexPath.section)

            if let cell = self.moviesCollectionView.cellForItem(at: movieIndexPath) as? MovieCell {
                cell.update(with: image, movie: movie)
            }
        }
    }

}
