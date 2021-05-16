//
//  SimpleFocusViewModifier.swift
//  MyTVPlayground
//
//  Created by Pedro Antunes on 16/05/2021.
//

import SwiftUI

struct SimpleFocusViewModifier: ViewModifier {
    let onFocus: (Bool) -> ()
    let onSelect: () -> ()
    @State private var isFocused = false
    func body(content: Content) -> some View {
        content
            .padding()
            .scaleEffect(isFocused ? 1.2 : 1)
            .focusable() { newValue in
                isFocused = newValue
                onFocus(newValue)
            }
            .animation(.easeInOut, value: isFocused)
            .onLongPressGesture(minimumDuration: 0.01, pressing: { _ in },perform: {
                onSelect()
            })
    }
}

extension View {
    func simpleFocus(_ onFocus: @escaping (Bool) -> (), onSelect: @escaping () -> () = {}) -> some View {
        modifier(SimpleFocusViewModifier(onFocus: onFocus, onSelect: onSelect))
    }
}
