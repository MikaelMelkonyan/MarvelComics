//
//  ComicsAPICallerProtocol.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/30/24.
//

import Foundation

protocol ComicsAPICallerProtocol {
    func comics(forCharacter id: Int) async throws -> [Comic]
}

// MARK: - ComicsAPICallerProtocol
extension APICaller: ComicsAPICallerProtocol {
    func comics(forCharacter id: Int) async throws -> [Comic] {
        guard !APIs.authItems.isEmpty else { throw NetworkError.apiKeysMissing }
        
        let api = APIs.comics(characterID: id)
        var parameters = APIs.authItems
        parameters.append(.init(name: "characters", value: "\(id)"))
        let resource = HTTPResource(url: api.url, method: .get(parameters), modelType: APIResponse<[Comic]>.self)
        return try await httpClient.load(resource).results
    }
}
