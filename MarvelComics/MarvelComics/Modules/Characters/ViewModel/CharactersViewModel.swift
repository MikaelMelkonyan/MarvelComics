//
//  CharactersViewModel.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import Foundation

@Observable
final class CharactersViewModel {
    var characters: [Character] = []
    var error: Error?
    
    private let apiCaller: CharactersAPICallerProtocol
    
    init(apiCaller: CharactersAPICallerProtocol) {
        self.apiCaller = apiCaller
    }
}

// MARK: - CharactersViewModelProtocol
extension CharactersViewModel: CharactersViewModelProtocol {
    func loadCharacters() async {
        do {
            characters = try await apiCaller.characters()
        } catch {
            self.error = error
        }
    }
}

