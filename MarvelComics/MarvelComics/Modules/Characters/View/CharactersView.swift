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
            ScrollView {
                LazyHGrid(
                    rows: [.init(.flexible(), spacing: 10, alignment: .top)]
                ) {
                    ForEach(viewModel.characters) { character in
                        Text(character.name)
                    }
                }
            }
            .task { await viewModel.loadCharacters() }
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
