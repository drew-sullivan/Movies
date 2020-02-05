//
//  DetailMovieViewController.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
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
                    self.notifyUser(of: error)
            }
        }
    }

}
