//
//  Comic.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/30/24.
//

struct Comic: Identifiable, Decodable {
    let id: Int
    let title: String
    let issueNumber: Int
    let thumbnail: Thumbnail
    let series: Serie
}
