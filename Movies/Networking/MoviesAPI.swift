//
//  MoviesAPI.swift
//  Movies
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import Foundation

enum MovieListType {
    case topRated
    case upcoming
    case nowPlaying
    case popular
}

struct MoviesAPI {

    private enum MovieQueryKey: String {
        case apiKey = "api_key"
        case region = "region"
        case primaryReleaseYear = "primary_release_year"
        case sortBy = "sort_by"
        case primaryReleaseDateGreaterThanOrEqualTo = "primary_release_date.gte"
    }

    /// Hard-coded values that would be abstracted out in a dynamic environment
    private enum MovieQueryValue: String {
        case currentYear = "2020"
        case oneMonthInTheFuture = "2020-03-02"
        case threeMonthsInThePast = "2019-10-01"
        case sortByPopularity = "popularity.desc"
        case sortByVoteAverage = "vote_average.desc"
    }

    /// Constants
    private static let searchingBaseURLString = "https://api.themoviedb.org/3/discover/movie"
    private static let imageBaseURLString = "https://image.tmdb.org/t/p/w500"
    private static let apiKey = "66be1732d5639d9978db6f80685fcccd"
    private static let region = "US"

    /// Current top-rated movies
    static var topRatedMoviesURL: URL {
        let params = [
            MovieQueryKey.primaryReleaseYear: MovieQueryValue.currentYear,
            MovieQueryKey.sortBy: MovieQueryValue.sortByVoteAverage
        ]
        return buildSearchURL(parameters: params)
    }

    /// Upcoming movies
    static var upcomingMoviesURL: URL {
        let params = [
            MovieQueryKey.primaryReleaseDateGreaterThanOrEqualTo: MovieQueryValue.oneMonthInTheFuture
        ]
        return buildSearchURL(parameters: params)
    }


    /// Movies playing now
    static var nowPlayingMoviesURL: URL {
        let params = [
            MovieQueryKey.primaryReleaseDateGreaterThanOrEqualTo: MovieQueryValue.threeMonthsInThePast
        ]
        return buildSearchURL(parameters: params)
    }

    /// Popular movies
    static var popularMoviesURL: URL {
        let params = [
            MovieQueryKey.sortBy: MovieQueryValue.sortByPopularity
        ]
        return buildSearchURL(parameters: params)
    }

    /// Helper for building URLs with common data
    /// - Parameter parameters: Key/Value pairs added to the query string of the URL being constructed
    private static func buildSearchURL(parameters: [MovieQueryKey: MovieQueryValue]?) -> URL {
        var components = URLComponents(string: searchingBaseURLString)!

        var queryItems = [URLQueryItem]()

        let baseParams = [
            MovieQueryKey.apiKey: apiKey,
            MovieQueryKey.region: region
        ]

        for (key, val) in baseParams {
            let item = URLQueryItem(name: key.rawValue, value: val)
            queryItems.append(item)
        }

        if let additionalParams = parameters {
            for (key, val) in additionalParams {
                let item = URLQueryItem(name: key.rawValue, value: val.rawValue)
                queryItems.append(item)
            }
        }

        components.queryItems = queryItems
        return components.url!
    }

    /// Creates the URL needed to access a movie poster
    /// - Parameter posterPath: posterPath from Movie object
    static func moviePosterImageURL(fromPosterPath posterPath: String) -> URL {
        return URL(string: "\(imageBaseURLString)\(posterPath)")!
    }

    /// Converts JSON to Movie objects
    /// - Parameter data: jsonData object
    static func movies(_ data: Data) -> MovieResult {
        do {
            let decoder = JSONDecoder()
            let meta = try decoder.decode(MoviesMeta.self, from: data)
            return .success(meta.movies)
        } catch let e {
            return .failure(e)
        }
    }
    
}
