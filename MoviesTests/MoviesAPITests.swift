//
//  MoviesAPITests.swift
//  MoviesTests
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import XCTest
@testable import Movies

class MoviesAPITests: XCTestCase {

    func test_topRatedMoviesURL_usesExpectedHost() {
        let moviesAPIurlComponents = URLComponents(url: MoviesAPI.topRatedMoviesURL, resolvingAgainstBaseURL: false)
        XCTAssertEqual(moviesAPIurlComponents?.host, "api.themoviedb.org")
    }

    func test_topRatedMoviesURL_usesExpectedPath() {
        let moviesAPIurlComponents = URLComponents(url: MoviesAPI.topRatedMoviesURL, resolvingAgainstBaseURL: false)
        XCTAssertEqual(moviesAPIurlComponents?.path, "/3/discover/movie")
    }

    func test_topRatedMoviesURL_usesExpectedQuery() {
        let moviesAPIurlComponents = URLComponents(url: MoviesAPI.topRatedMoviesURL, resolvingAgainstBaseURL: false)
        let queryItem = URLQueryItem(name: "primary_release_year", value: "2020")
        guard let containsQueryItem = moviesAPIurlComponents?.queryItems?.contains(queryItem) else {
            XCTFail()
            return
        }
        XCTAssertTrue(containsQueryItem)
    }

    func test_upcomingMoviesURL_usesExpectedQuery() {
        let moviesAPIurlComponents = URLComponents(url: MoviesAPI.upcomingMoviesURL, resolvingAgainstBaseURL: false)
        let queryItem = URLQueryItem(name: "primary_release_date.gte", value: "2020-03-02")
        guard let containsQueryItem = moviesAPIurlComponents?.queryItems?.contains(queryItem) else {
            XCTFail()
            return
        }
        XCTAssertTrue(containsQueryItem)
    }

    func test_nowPlayingMoviesURL_usesExpectedQuery() {
        let moviesAPIurlComponents = URLComponents(url: MoviesAPI.nowPlayingMoviesURL, resolvingAgainstBaseURL: false)
        let queryItem = URLQueryItem(name: "primary_release_date.gte", value: "2019-10-01")
        guard let containsQueryItem = moviesAPIurlComponents?.queryItems?.contains(queryItem) else {
            XCTFail()
            return
        }
        XCTAssertTrue(containsQueryItem)
    }

    func test_popularMoviesURL_usesExpectedQuery() {
        let moviesAPIurlComponents = URLComponents(url: MoviesAPI.popularMoviesURL, resolvingAgainstBaseURL: false)
        let queryItem = URLQueryItem(name: "sort_by", value: "popularity.desc")
        guard let containsQueryItem = moviesAPIurlComponents?.queryItems?.contains(queryItem) else {
            XCTFail()
            return
        }
        XCTAssertTrue(containsQueryItem)
    }

}
