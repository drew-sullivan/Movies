//
//  MovieViewController.swift
//  Movies
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    var movieStore: MovieStore!
    @IBOutlet weak var moviesCollectionView: UICollectionView!

    override func viewDidLoad() {
        setUpUI()
        movieStore.fetchMovieMetadata(by: .nowPlaying) { (movieResult) in
            switch movieResult {
            case .success(let movies):
                print("Count: \(movies.count)")
            case .failure(let error):
                self.notifyUser(ofError: error)
            }
        }
    }

    private func notifyUser(ofError error: Error) {

    }

    private func setUpUI() {
//        moviesCollectionView.dataSource =
        moviesCollectionView.delegate = self
    }
    
}

extension MovieViewController: UICollectionViewDelegate {
    
}
