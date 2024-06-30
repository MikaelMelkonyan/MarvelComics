//
//  ErrorAlert.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/29/24.
//

import SwiftUI

extension View {
    func errorAlert(
        error: Binding<Error?>,
        buttonTitle: LocalizedStringKey = "OK",
        buttonAction: (() -> Void)? = nil
    ) -> some View {
        let localizedAlertError = LocalizedAlertError(error: error.wrappedValue)
        return alert(isPresented: .constant(localizedAlertError != nil), error: localizedAlertError) { _ in
            Button(buttonTitle) {
                error.wrappedValue = nil
                buttonAction?()
            }
        } message: { error in
            Text(error.recoverySuggestion ?? "")
        }
    }
}
