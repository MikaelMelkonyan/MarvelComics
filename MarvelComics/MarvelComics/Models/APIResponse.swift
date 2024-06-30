//
//  APIResponse.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import Foundation

struct APIResponse<Results>: Decodable where Results: Decodable {
    let results: Results
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let data = try container.decode(Data<Results>.self, forKey: .data)
        self.results = data.results
    }
    
    private enum CodingKeys: CodingKey {
        case data
    }
}

private struct Data<Results>: Decodable where Results: Decodable {
    let results: Results
}
