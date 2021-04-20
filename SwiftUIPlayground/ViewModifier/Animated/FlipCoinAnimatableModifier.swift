//
//  FlipCoinAnimatableModifier.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 18/04/2021.
//

import SwiftUI

private struct FlipCoinAnimatableModifier: AnimatableModifier {
    let gradient = LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .topLeading, endPoint: .trailing)
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(gradient)
                .frame(width: 20)
        Circle()
            .fill(gradient)
            .rotation3DEffect(
                .degrees(80),
                axis: (x: 0.0, y: 1.0, z: 0.0))
            .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        }
        .frame(maxHeight: 120)
    }
}

extension View {
    func flipCoin() -> some View {
        modifier(FlipCoinAnimatableModifier())
    }
}

struct FlipCoinAnimatableModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Pedro")
            .flipCoin()
    }
}
