//
//  CharacterDetailsView.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/30/24.
//

import SwiftUI

struct CharacterDetailsView<ViewModel>: View where ViewModel: CharacterDetailsViewModelProtocol {
    @Bindable var viewModel: ViewModel
    
    var body: some View {
        content
            .accessibilityIdentifier("CharacterDetails")
            .task { await viewModel.loadComics() }
            .errorAlert(error: $viewModel.error, buttonAction: {
                Task {
                    await viewModel.loadComics()
                }
            })
    }
}

// MARK: - Private
private extension CharacterDetailsView {
    var content: some View {
        ZStack {
            backgroundPoster
            
            comics
        }
    }
    
    var backgroundPoster: some View {
        GeometryReader { proxy in
            HStack(spacing: 0) {
                ImageLoaderView(urlString: viewModel.thumbnailURL)
                    .frame(width: proxy.size.width / 2, height: proxy.size.height)
                    .mask(LinearGradient(
                        gradient: Gradient(colors: [.black, .black, .clear]),
                        startPoint: .leading,
                        endPoint: .trailing
                    ))
                    .mask(LinearGradient(
                        gradient: Gradient(colors: [.black, .black, .clear, .clear]),
                        startPoint: .top,
                        endPoint: .bottom
                    ))
                
                Spacer()
            }
        }
    }
    
    var comics: some View {
        VStack(spacing: 0) {
            Spacer()
            
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(viewModel.comics) { comic in
                        ComicItemView(comic: comic)
                            .padding(30)
                    }
                }
                .buttonStyle(DisabledFocusButtonStyle())
                .focusEffectDisabled()
            }
        }
    }
}

#Preview {
    CharacterDetailsView<CharacterDetailsViewModel>(
        viewModel: .init(
            character: .init(
                id: 1009144,
                name: "Very Long Name of Character",
                thumbnail: .init(
                    path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec",
                    extension: "jpg"
                )
            ),
            apiCaller: APICaller(
                httpClient: HTTPClient.default
            )
        )
    )
}
