//
//  MarvelComicsAssetsTests.swift
//  MarvelComicsTests
//
//  Created by Mikael Melkonyan on 6/30/24.
//

import Foundation
import XCTest
@testable import MarvelComics

final class MarvelComicsAssetsTests: XCTestCase {
    func testAuthItemsExist() {
        XCTAssertFalse(APIs.authItems.isEmpty, "privateKey and/or publicKey from developer.marvel.com is missing in Keys.plist file")
    }
    
    func testUsedSystemImages() {
        let imagePlaceholderName = Constants.imagePlaceholderName
        let imagePlaceholder = UIImage(systemName: imagePlaceholderName)
        XCTAssertNotNil(imagePlaceholder, "SystemImages is missing an entry for \(imagePlaceholderName)")
    }
}
