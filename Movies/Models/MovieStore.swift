//
//  MovieStore.swift
//  Movies
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
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

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}

enum PhotoError: Error {
    case imageCreationError
}

/// Abstracted for testing
protocol SessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

class MovieStore {

    let imageCache = ImageCache()

    lazy var session: SessionProtocol = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    func fetchMovieMetadata(by movieListType: MovieListType, completion: @escaping (MovieResult) -> Void) {
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

            let movieResult = self.processMoviesRequest(data, error: error)
            DispatchQueue.main.async {
                completion(movieResult)
            }
        }
        dataTask.resume()
    }

    func fetchPosterImage(for movie: Movie, completion: @escaping (ImageResult) -> Void) {
        let posterImageURL = movie.posterImageURL

        if let image = imageCache.image(forKey: posterImageURL) {
            OperationQueue.main.addOperation {
                completion(.success(image))
            }
            return
        }

        let dataTask = session.dataTask(with: posterImageURL) { (data, response, error) in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(.failure(WebServiceError.responseError))
                    return
                }

                let imageResult = self.processImageRequest(data, error: error)

                if case let .success(image) = imageResult {
                    self.imageCache.setImage(image, forKey: posterImageURL)
                }

                completion(imageResult)
            }
        }
        dataTask.resume()
    }

    private func processMoviesRequest(_ jsonData: Data?, error: Error?) -> MovieResult {
        guard let data = jsonData else {
            return .failure(WebServiceError.dataEmptyError)
        }
        return MoviesAPI.movies(data)
    }

    private func processImageRequest(_ jsonData: Data?, error: Error?) -> ImageResult {
        guard let data = jsonData else {
            return .failure(WebServiceError.dataEmptyError)
        }

        guard let image = UIImage(data: data) else {
            return .failure(PhotoError.imageCreationError)
        }

        return .success(image)
    }

}

/// For testing
extension URLSession: SessionProtocol { }
