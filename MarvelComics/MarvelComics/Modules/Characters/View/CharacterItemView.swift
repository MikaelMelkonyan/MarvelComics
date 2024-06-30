//
//  CharacterItemView.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import SwiftUI

struct CharacterItemView: View {
    let character: Character
    
    var body: some View {
        VStack {
            ImageLoaderView(urlString: character.thumbnail.urlString)
                .frame(width: 180, height: 180)
                .clipShape(Circle())
            
            Text(character.name)
                .multilineTextAlignment(.center)
        }
        .frame(width: 180)
    }
}

#Preview {
    CharacterItemView(
        character: .init(
            id: 1009144,
            name: "Very Long Name of Character",
            thumbnail: .init(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
                extension: "jpg"
            )
        )
    )
}
