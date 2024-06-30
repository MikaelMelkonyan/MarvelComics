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
    
    private let apiCaller: ComicsAPICallerProtocol
    
    init(character: Character, apiCaller: ComicsAPICallerProtocol) {
        self.character = character
        self.apiCaller = apiCaller
    }
}

// MARK: - CharactersViewModelProtocol
extension CharacterDetailsViewModel: CharacterDetailsViewModelProtocol {
}
