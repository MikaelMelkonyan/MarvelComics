//
//  CharactersViewModelProtocol.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import Foundation

protocol CharactersViewModelProtocol: Observable {
    var characters: [Character] { get }
    
    func loadCharacters() async
}
