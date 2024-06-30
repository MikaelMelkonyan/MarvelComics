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
    }
}

// MARK: - Private
private extension CharacterDetailsView {
    var content: some View {
    }
    
