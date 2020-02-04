//
//  DetailMovieViewController.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Allegion, LLC. All rights reserved.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var movieOverviewLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!

    var viewModel: DetailViewModel!
    var movieStore: MovieStore!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        movieOverviewLabel.text = viewModel.movieOverview
        movieGenreLabel.text = viewModel.movieGenres
        navigationItem.title = viewModel.movieTitle

        movieStore.fetchPosterImage(for: viewModel.movie) { (imageResult) in
            switch imageResult {
                case .success(let image):
                    self.moviePosterImageView.image = image
                case .failure(let error):
                    self.showError(error)
            }
        }
    }

    private func showError(_ error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }

}
