//
//  DetailViewModel.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Allegion, LLC. All rights reserved.
//

import UIKit

class DetailViewModel {

    var movie: Movie
    var movieTitle: String {
        guard let title = movie.title else {
            return "No title provided"
        }
        return title
    }
    var movieOverview: String {
        guard let overview = movie.overview else {
            return "No overview provided"
        }
        return overview
    }
    var movieGenres: String {
        guard let genreIDs = movie.genreIDS else {
            return "No genres provided"
        }
        return formatGenres(genreIDs)
    }

    init(movie: Movie) {
        self.movie = movie
    }

    private func formatGenres(_ genreIDs: [Int]) -> String {
        if genreIDs.count < 1 { return "" }
        if genreIDs.count == 1, let genre = MoviesAPI.genres[genreIDs[0]] {
            return genre
        }
        var genres = ""
        for i in 0..<genreIDs.count {
            // if first item, do not add a comma after
            if i == 0 {
                guard let genre = MoviesAPI.genres[genreIDs[0]] else { break }
                genres += "\(genre)"
            } else if let genreName = MoviesAPI.genres[genreIDs[i]] {
                genres += ", \(genreName)"
            }
        }
        return genres
    }

}
