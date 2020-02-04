//
//  MovieStoreTests.swift
//  MoviesTests
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Allegion, LLC. All rights reserved.
//

import XCTest
@testable import Movies

class MovieStoreTests: XCTestCase {

    var sut: MovieStore!

    override func setUp() {
        sut = MovieStore()
    }

    override func tearDown() {
        sut = nil
    }

}


// this will go in the store
//protocol SessionProtocol {
//    func dataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
//}


//extension MoviesAPITests {
//
//    let mockURLSession = MockURLSession()
//    sut.session = mockURLSession
//
//    class MockURLSession {
//        var url: URL?
//
//        func dataTask(with url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//            self.url = url
//            return URLSession.shared.dataTask(with: url)
//        }
//    }
//
//}
