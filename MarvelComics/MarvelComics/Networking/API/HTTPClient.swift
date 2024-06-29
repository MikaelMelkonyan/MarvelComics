//
//  HTTPClient.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import Foundation

enum HTTPMethod {
    case get([URLQueryItem])
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}

struct HTTPResource<T: Decodable> {
    let url: URL
    var method: HTTPMethod = .get([])
    var modelType: T.Type
}

protocol HTTPClientProtocol {
    func load<T: Decodable>(_ resource: HTTPResource<T>) async throws -> T
}

struct HTTPClient: HTTPClientProtocol {
    static let `default`: HTTPClient = HTTPClient()
    
    private let session: URLSession
    
    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Content-Type": "application/json"]
        self.session = URLSession(configuration: configuration)
    }
    
    func load<T: Decodable>(_ resource: HTTPResource<T>) async throws -> T {
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.method.name
        
        switch resource.method {
        case .get(let queryItems):
            var components = URLComponents(url: resource.url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            
            guard let url = components?.url else {
                throw NetworkError.badRequest
            }
            
            request = URLRequest(url: url)
        }
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            let errorDescriptionDictonary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : String]
            throw NetworkError.httpError(httpResponse.statusCode, errorDescriptionDictonary?["message"])
        }
        
        do {
            let result = try JSONDecoder().decode(resource.modelType, from: data)
            return result
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
