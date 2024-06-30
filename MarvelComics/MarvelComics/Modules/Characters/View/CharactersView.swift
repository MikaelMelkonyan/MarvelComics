//
//  CharactersView.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import SwiftUI

struct CharactersView<ViewModel>: View where ViewModel: CharactersViewModelProtocol {
    let viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            content
                .accessibilityIdentifier("PopularCharacters")
                .task { await viewModel.loadCharacters() }
        }
    }
}

// MARK: - Private
private extension CharactersView {
    var content: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("POPULAR CHARACTERS")
            
            popularCharacters
            
            Spacer()
        }
    }
    
    var popularCharacters: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(viewModel.characters) { character in
                    NavigationLink {
                        
                    } label: {
                        CharacterItemView(character: character)
                            .padding(10)
                    }
                    .buttonStyle(CardButtonStyle())
                    .padding(30)
                }
            }
        }
    }
}

#Preview {
    CharactersView<CharactersViewModel>(
        viewModel: .init(
            apiCaller: APICaller(
                httpClient: HTTPClient.default
            )
        )
    )
}
