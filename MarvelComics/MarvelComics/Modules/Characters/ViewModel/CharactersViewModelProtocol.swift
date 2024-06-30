//
//  CharactersViewModelProtocol.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import Foundation

protocol CharactersViewModelProtocol: Observable, AnyObject {
    var characters: [Character] { get }
    var error: Error? { get set }
    
    func loadCharacters() async
}
