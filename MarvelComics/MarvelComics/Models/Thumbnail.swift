//
//  Thumbnail.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

struct Thumbnail: Decodable {
    let path: String
    let `extension`: String
    
    var urlString: String {
        "\(path).\(`extension`)"
    }
}
