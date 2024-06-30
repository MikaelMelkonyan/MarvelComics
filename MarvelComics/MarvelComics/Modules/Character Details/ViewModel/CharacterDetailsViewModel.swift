//
//  CharacterDetailsViewModel.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/30/24.
//

import Foundation

@Observable
final class CharacterDetailsViewModel {
    let character: Character
    var comics: [Comic] = []
    var error: Error?
    
    private let apiCaller: ComicsAPICallerProtocol
    
    init(character: Character, apiCaller: ComicsAPICallerProtocol) {
        self.character = character
        self.apiCaller = apiCaller
    }
}

// MARK: - CharactersViewModelProtocol
extension CharacterDetailsViewModel: CharacterDetailsViewModelProtocol {
    var thumbnailURL: String {
        character.thumbnail.urlString
    }
    
    func loadComics() async {
        do {
            comics = try await apiCaller.comics(forCharacter: character.id)
        } catch {
            self.error = error
        }
    }
}
