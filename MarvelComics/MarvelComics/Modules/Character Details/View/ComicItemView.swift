//
//  ComicItemView.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/30/24.
//

import SwiftUI

struct ComicItemView: View {
    let comic: Comic
    
    var body: some View {
        VStack(alignment: .leading) {
            ImageLoaderView(urlString: comic.thumbnail.urlString)
                .frame(width: 180, height: 320)
            
            Text(comic.title)
                .multilineTextAlignment(.center)
        }
        .frame(width: 180)
    }
}

#Preview {
    ComicItemView(
        comic: .init(
            id: 1009144,
            title: "Very Long Name of Character",
            issueNumber: 90,
            thumbnail: .init(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
                extension: "jpg"
            )
        )
    )
}
