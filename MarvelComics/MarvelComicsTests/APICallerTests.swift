//
//  APICallerTests.swift
//  MarvelComicsTests
//
//  Created by Mikael Melkonyan on 6/30/24.
//

import XCTest
@testable import MarvelComics

final class APICallerTests: XCTestCase {
    func testCharactersSuccess() async throws {
        let mockHTTPClient: MockHTTPClient<[Character]> = MockHTTPClient()
        let apiCaller: APICaller = APICaller(httpClient: mockHTTPClient)
        
        let charactersData = APIResponse<[Character]>(results: [])
        mockHTTPClient.result = .success(charactersData)
        
        do {
            let characters = try await apiCaller.characters()
            XCTAssertEqual(characters.count, 0)
        } catch {
            XCTFail("Expected success, but got \(error) instead.")
        }
    }
    
    func testCharacterDetailsSuccess() async throws {
        let mockHTTPClient: MockHTTPClient<[Comic]> = MockHTTPClient()
        let apiCaller: APICaller = APICaller(httpClient: mockHTTPClient)
        
        let comic = Comic(
            id: 1,
            title: "Test Comic",
            issueNumber: 1,
            thumbnail: Thumbnail(path: "", extension: "jpg"),
            series: Serie(name: "Test Serie")
        )
        let comicsData = APIResponse<[Comic]>(results: [comic])
        mockHTTPClient.result = .success(comicsData)
        
        do {
            let result = try await apiCaller.comics(forCharacter: 1)
            XCTAssertEqual(result.first?.id, 1)
            XCTAssertEqual(result.first?.title, "Test Comic")
            XCTAssertEqual(result.first?.issueNumber, 1)
        } catch {
            XCTFail("Expected success, but got \(error) instead.")
        }
    }
}
