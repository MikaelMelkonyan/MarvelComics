//
//  ImageLoaderView.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import SwiftUI

struct ImageLoaderView: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { phase in
            switch phase {
            case .failure:
                Image(systemName: Constants.imagePlaceholderName)
                    .font(.largeTitle)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            default:
                ProgressView()
            }
        }
    }
}

#Preview {
    ImageLoaderView(urlString: Constants.previewImageUrl)
        .frame(width: 256, height: 256)
}
