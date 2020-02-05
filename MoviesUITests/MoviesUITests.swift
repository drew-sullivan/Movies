//
//  MoviesUITests.swift
//  MoviesUITests
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import XCTest

class MoviesUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()

        app = XCUIApplication()
        app.launch()
    }

    override func tearDown() {
        app = nil

        super.tearDown()
    }

    func test_segue() {
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.tap()
        app.navigationBars["Bad Boys for Life"].buttons["Awesome Movie to See!"].tap()
    }
}
