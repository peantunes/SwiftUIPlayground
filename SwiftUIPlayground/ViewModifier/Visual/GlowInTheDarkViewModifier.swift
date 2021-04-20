//
//  GlowInTheDarkViewModifier.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 17/04/2021.
//

import SwiftUI

private struct GlowInTheDarkViewModifier: ViewModifier {
    let active: Bool
    @ViewBuilder func body(content: Content) -> some View {
        if active {
            content
                .shadow(color: .yellow, radius: 1)
                .shadow(color: .white, radius: 3)
                .shadow(color: .green, radius: 5)
                .shadow(color: .blue, radius: 5)
                .shadow(color: .green, radius: 10)
                .shadow(color: .blue, radius: 10)
        } else {
            content
        }
            
    }
}

extension View {
    func glowInTheDark(_ active: Bool = true) -> some View {
        modifier(GlowInTheDarkViewModifier(active: active))
    }
}

struct GlowInTheDarkViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("🕸")
            .xxlText(4)
            .font(.system(size: 50))
            .glowInTheDark()
            .impressMe()
    }
}
