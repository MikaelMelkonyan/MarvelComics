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
        Button {} label: {
            content
        }
        .disabledFocus()
        .padding(10)
    }
}

// MARK: - Private
private extension ComicItemView {
    var content: some View {
        VStack(alignment: .leading, spacing: 10) {
            ImageLoaderView(urlString: comic.thumbnail.urlString)
                .frame(width: 180, height: 320)
                .clipShape(Rectangle())
            
            Text(comic.series.name)
                .lineLimit(3)
            
            Text("Issue #\(comic.issueNumber)")
                .font(.footnote)
                .foregroundStyle(Color.secondary)
        }
        .frame(width: 180)
    }
}

#Preview {
    ComicItemView(
        comic: .init(
            id: 1009144,
            title: "Very Long Name of Comic",
            issueNumber: 90,
            thumbnail: .init(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
                extension: "jpg"
            ),
            series: .init(name: "Very Long Name of Serie")
        )
    )
}
