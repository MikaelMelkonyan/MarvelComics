//
//  APIs.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import Foundation

enum APIs {
    case characters
    
    private var baseURL: URL {
        URL(string: "https://gateway.marvel.com")!
    }
    
    private var baseURLWithVersion: URL {
        baseURL.appendingPathComponent("v1/public")
    }
    
    var url: URL {
        switch self {
        case .characters:
            return baseURLWithVersion.appendingPathComponent("/characters")
        }
    }
    
    static var authItems: [URLQueryItem] {
        guard let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
              let keys = NSDictionary(contentsOfFile: path),
              let publicKey = keys[AuthItemKeys.publicKey.rawValue] as? String,
              !publicKey.isEmpty,
              let privateKey = keys[AuthItemKeys.privateKey.rawValue] as? String,
              !privateKey.isEmpty else { return [] }
        
        let timestamp = String(Int64(Date().timeIntervalSince1970 * 1000))
        let hash = String(timestamp + privateKey + publicKey).md5()
        
        return [
            .init(name: AuthItemKeys.apikey.rawValue, value: publicKey),
            .init(name: AuthItemKeys.timeStamp.rawValue, value: timestamp),
            .init(name: AuthItemKeys.hash.rawValue, value: hash)
        ]
    }
    
    private enum AuthItemKeys: String {
        case apikey
        case publicKey
        case privateKey
        case timeStamp = "ts"
        case hash
    }
}
