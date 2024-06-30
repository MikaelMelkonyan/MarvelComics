//
//  CharactersAPICallerProtocol.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

protocol CharactersAPICallerProtocol {
    func characters() async throws -> [Character]
}

// MARK: - CharactersAPICallerProtocol
extension APICaller: CharactersAPICallerProtocol {
    func characters() async throws -> [Character] {
        guard !APIs.authItems.isEmpty else { throw NetworkError.apiKeysMissing }
        
        let resource = HTTPResource(url: APIs.characters.url, method: .get(APIs.authItems), modelType: APIResponse<[Character]>.self)
        return try await httpClient.load(resource).results
    }
}
