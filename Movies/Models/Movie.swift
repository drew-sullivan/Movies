//
//  Movie.swift
//  Movies
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let posterPath: String?
    let genreIDS: [Int]?
    let title: String?
    let overview: String?
    var posterImageURL: URL {
        return MoviesAPI.moviePosterImageURL(from: posterPath!)
    }

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case genreIDS = "genre_ids"
        case title
        case overview
    }
}

/// Wrapper for matching returned JSON
struct MoviesMeta: Decodable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case movies = "results"
    }
}
