//
//  MovieSection.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Allegion, LLC. All rights reserved.
//

import Foundation

struct MovieSection: Comparable {
    var name: MovieListType
    var movies: [Movie]

    static func <(lhs: MovieSection, rhs: MovieSection) -> Bool {
        return lhs.name.rawValue < rhs.name.rawValue
    }
}
