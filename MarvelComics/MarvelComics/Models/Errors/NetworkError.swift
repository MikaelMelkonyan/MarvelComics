//
//  NetworkError.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import SwiftUI

enum NetworkError: Error {
    case badRequest
    case decodingError(Error)
    case invalidResponse
    case httpError(Int, String?)
    case apiKeysMissing
}

// MARK: - LocalizedError
extension NetworkError: LocalizedError {
    var errorDescription: String? {
        let key: String.LocalizationValue
        switch self {
        case .badRequest, .httpError:
            key = .init(stringLiteral: "Bad request")
        case .decodingError:
            key = .init(stringLiteral: "Decoding Error")
        case .invalidResponse:
            key = .init(stringLiteral: "Invalid response")
        case .apiKeysMissing:
            key = .init(stringLiteral: "Missing API Keys")
        }
        return String(localized: key)
    }
    
    var recoverySuggestion: String? {
        switch self {
        case let .httpError(_ , description):
            return description
        case .apiKeysMissing:
            let key = String.LocalizationValue("Missing API Keys. Description")
            return String(localized: key)
        default:
            return nil
        }
    }
}
