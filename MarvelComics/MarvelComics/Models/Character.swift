//
//  Character.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

struct Character: Identifiable, Decodable {
    let id: Int
    let name: String
    let thumbnail: Thumbnail
}
