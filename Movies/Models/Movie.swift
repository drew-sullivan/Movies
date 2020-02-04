//
//  Movie.swift
//  Movies
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import Foundation

struct Movie: Decodable, Equatable {
    let posterPath: String?
    let genreIDS: [Int]?
    let title: String?
    let overview: String?
    var posterImageURL: URL {
        return MoviesAPI.moviePosterImageURL(from: posterPath)
    }

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case genreIDS = "genre_ids"
        case title
        case overview
    }

    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.posterPath == rhs.posterPath &&
               lhs.genreIDS == rhs.genreIDS &&
               lhs.title == rhs.title &&
               lhs.overview == rhs.overview
    }
}

/// Wrapper for matching returned JSON
struct MoviesMeta: Decodable {
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}
