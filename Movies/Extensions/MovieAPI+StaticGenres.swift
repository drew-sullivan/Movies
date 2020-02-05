//
//  MovieAPI+StaticGenres.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import Foundation

extension MoviesAPI {

    /// I'd normally call this from an API and cache it, but I've done that elsewhere
    static var genres: [Int: String] {
        return  [
            28: "Action",
            12: "Adventure",
            16: "Animation",
            35: "Comedy",
            80: "Crime",
            99: "Documentary",
            18: "Drama",
            10751: "Family",
            14: "Fantasy",
            36: "History",
            27: "Horror",
            10402: "Music",
            9648: "Mystery",
            10749: "Romance",
            878: "Science Fiction",
            10770: "TV Movie",
            53: "Thriller",
            10752: "War",
            37: "Western"
        ]
    }

}
