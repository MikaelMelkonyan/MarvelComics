//
//  NetworkError.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError(Error)
    case invalidResponse
    case httpError(Int, String?)
    case apiKeysMissing
}
