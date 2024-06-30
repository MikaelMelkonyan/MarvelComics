//
//  MarvelComicsUITests.swift
//  MarvelComicsUITests
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import XCTest

final class MarvelComicsUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testLaunchPerformance() throws {
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
