//
//  MockHTTPClient.swift
//  MarvelComicsTests
//
//  Created by Mikael Melkonyan on 6/30/24.
//

import Foundation
@testable import MarvelComics

final class MockHTTPClient<Results: Decodable>: HTTPClientProtocol {
    var result: Result<APIResponse<Results>, Error>?
    
    func load<T: Decodable>(_ resource: HTTPResource<T>) async throws -> T {
        switch result {
        case .success(let data as T):
            return data
        case .failure(let error):
            throw error
        case .none:
            throw NetworkError.badRequest
        case .some(.success(_)):
            throw NetworkError.invalidResponse
        }
    }
}
