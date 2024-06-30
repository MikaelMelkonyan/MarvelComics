//
//  MarvelComicsApp.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import SwiftUI

@main
struct MarvelComicsApp: App {
    var body: some Scene {
        WindowGroup {
            CharactersView<CharactersViewModel>(
                viewModel: .init(
                    apiCaller: APICaller(
                        httpClient: HTTPClient.default
                    )
                )
            )
        }
    }
}
