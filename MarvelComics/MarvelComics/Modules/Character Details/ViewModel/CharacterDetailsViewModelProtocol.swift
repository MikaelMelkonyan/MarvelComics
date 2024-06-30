//
//  CharacterDetailsViewModelProtocol.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/30/24.
//

import Foundation

protocol CharacterDetailsViewModelProtocol: Observable, AnyObject {
    var thumbnailURL: String { get }
    var comics: [Comic] { get }
    var error: Error? { get set }
    
    func loadComics() async
}
