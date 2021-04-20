//
//  FlamesViewModifier.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 17/04/2021.
//

import SwiftUI

private struct FlamesViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .yellow, radius: 2, x: 0.0, y: -2.0)
            .shadow(color: .orange, radius: 6, x: 0.0, y: -6.0)
            .shadow(color: .red, radius: 6, x: 0.0, y: -6.0)
            .shadow(color: .red, radius: 6, x: 0.0, y: -6.0)
            .shadow(color: .orange, radius: 6, x: 0.0, y: -6.0)
            .shadow(color: .yellow, radius: 4, x: 0.0, y: -6.0)
            
    }
}

extension View {
    func flames() -> some View {
        modifier(FlamesViewModifier())
    }
}

struct FlameViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("🏃🏻‍♂️")
            .xxlText(5)
            .flames()
            .impressMe()
    }
}
