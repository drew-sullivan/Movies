//
//  MovieStore.swift
//  Movies
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Allegion, LLC. All rights reserved.
//

import UIKit

class MovieStore {

    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
}
