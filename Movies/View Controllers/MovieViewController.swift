//
//  MovieViewController.swift
//  Movies
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var moviesCollectionView: UICollectionView!
    var movieStore: MovieStore!
    let movieDataSource = MovieDataSource()

    override func viewDidLoad() {
        setUpUI()
        populateDataSource()
    }

    private func populateDataSource() {
        for movieListType in MovieListType.allCases {
            movieStore.fetchMovieMetadata(by: movieListType) { (movieResult) in
                switch movieResult {
                    case .success(let movies):
                        print("Count: \(movies.count)")
                        let movieSection = MovieSection(name: movieListType, movies: movies)
                        self.movieDataSource.moviesBySection.append(movieSection)
                    case .failure(let error):
                        self.notifyUser(ofError: error)
                        self.movieDataSource.moviesBySection = [MovieSection]()
                }
            }
        }
        self.moviesCollectionView.reloadData()
    }

    private func notifyUser(ofError error: Error) {

    }

    private func setUpUI() {
        moviesCollectionView.dataSource = movieDataSource
        moviesCollectionView.delegate = self
    }
    
}

extension MovieViewController: UICollectionViewDelegate {
    
}
