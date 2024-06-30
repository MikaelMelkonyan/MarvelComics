//
//  DisabledFocusButtonStyle.swift
//  MarvelComics
//
//  Created by Mikael Melkonyan on 6/30/24.
//

import SwiftUI

struct DisabledFocusButtonStyle: ButtonStyle {
    @Environment(\.disabledFocus) var focus
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(focus ? 1.2 : 1)
    }
}

struct DisabledFocusKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    var disabledFocus: Bool {
        get { self[DisabledFocusKey.self] }
        set { self[DisabledFocusKey.self] = newValue }
    }
}

struct DisabledFocusModifier: ViewModifier {
    @FocusState var focus: Bool
    
    func body(content: Content) -> some View {
        content
            .focused($focus)
            .environment(\.disabledFocus, focus)
    }
}

extension View {
    func disabledFocus() -> some View {
        modifier(DisabledFocusModifier())
    }
}
