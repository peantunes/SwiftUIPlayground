//
//  AquaViewModifier.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 17/04/2021.
//

import SwiftUI

private struct AquaViewModifier: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        content
            .background(LinearGradient(gradient: Gradient(colors: [.white, color.opacity(0.6), .white]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(color, lineWidth: 2.0))
//            .shadow(color: color, radius: 4, x: 0.0, y: 6.0)
            .shadow(color: color, radius: 6, x: 0.0, y: 6.0)
    }
}

extension View {
    func aqua(color: Color = .blue) -> some View {
        modifier(AquaViewModifier(color: color))
    }
}

struct AquaViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("My button")
            .foregroundColor(.white)
            .padding()
            .aqua(color: .red)
            .impressMe()
    }
}
