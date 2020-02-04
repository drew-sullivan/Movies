//
//  MovieStore.swift
//  Movies
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Allegion, LLC. All rights reserved.
//

import UIKit

enum MovieResult {
    case success([Movie])
    case failure(Error)
}

enum WebServiceError: Error {
    case dataEmptyError
    case responseError
}

protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

class MovieStore {

    lazy var session: SessionProtocol = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    func fetchMovieMetadata(byMovieListType movieListType: MovieListType, completion: @escaping (MovieResult) -> Void) {

        var url: URL
        switch movieListType {
            case .topRated: url = MoviesAPI.topRatedMoviesURL
            case .upcoming: url = MoviesAPI.upcomingMoviesURL
            case .nowPlaying: url = MoviesAPI.nowPlayingMoviesURL
            case .popular: url = MoviesAPI.popularMoviesURL
        }

        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                completion(.failure(WebServiceError.responseError))
                return
            }

            guard let data = data else {
                completion(.failure(WebServiceError.dataEmptyError))
                return
            }
            
            let movieResult = self.processMoviesRequest(data)
            completion(movieResult)
        }
        dataTask.resume()
    }

    private func processMoviesRequest(_ jsonData: Data) -> MovieResult {
        return MoviesAPI.movies(jsonData)
    }

}

extension URLSession: SessionProtocol { }
