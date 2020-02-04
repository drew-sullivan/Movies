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
        super.viewDidLoad()

        moviesCollectionView.dataSource = movieDataSource
        moviesCollectionView.delegate = self

        populateDataSource()
    }

    private func populateDataSource() {
        for movieListType in MovieListType.allCases {
            movieStore.fetchMovieMetadata(by: movieListType) { (movieResult) in
                switch movieResult {
                    case .success(let movies):
                        let movieSection = MovieSection(name: movieListType, movies: movies)
                        self.movieDataSource.moviesBySection.append(movieSection)
                    case .failure(let error):
                        self.notifyUser(ofError: error)
                        self.movieDataSource.moviesBySection = [MovieSection]()
                }
                self.moviesCollectionView.reloadData()
            }
        }
    }

    private func notifyUser(of error: Error) {
        let okAlertController = UIAlertController.errorWarning(given: error)
        self.present(okAlertController, animated: true)
    }

    private func notifyUser(ofError error: Error) {
        let alertController = UIAlertController(title: "Error:", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
            case "ShowMovie"?:
            if let selectedIndexPath = moviesCollectionView.indexPathsForSelectedItems?.first {
                let movie = movieDataSource.moviesBySection[selectedIndexPath.section].movies[selectedIndexPath.row]
                let destinationVC = segue.destination as! DetailMovieViewController
                let detailViewModel = DetailViewModel(movie: movie)
                destinationVC.viewModel = detailViewModel
                destinationVC.movieStore = movieStore
            }
            default: preconditionFailure("Unexpected segue identifier.")
        }
    }
    
}
