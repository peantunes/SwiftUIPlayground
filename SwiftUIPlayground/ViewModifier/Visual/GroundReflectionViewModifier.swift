//
//  GroundReflectionViewModifier.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 17/04/2021.
//

import SwiftUI

private struct GroundReflectionViewModifier: ViewModifier {
    let offsetY: CGFloat
    func body(content: Content) -> some View {
        content
            .overlay(
                content
                    .mask(
                        LinearGradient(
                            gradient: Gradient(stops: [.init(color: .white, location: 0.0), .init(color: .clear, location: 0.6)]),
                            startPoint: .bottom,
                            endPoint: .top)
                    )
                    .scaleEffect(x: 1.0, y: -1.0, anchor: .bottom)
                    .opacity(0.3)
                    .offset(y: offsetY)
                
            )
        
    }
}

extension View {
    func reflection(offsetY: CGFloat = 1) -> some View {
        modifier(GroundReflectionViewModifier(offsetY: offsetY))
    }
}

struct GroundReflectionViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Text("🍄")
                .xxlText(1)
                .padding()
                .aqua()
                .reflection(offsetY: 10)
            Text("🐳")
                .xxlText(1)
                .padding()
                .aqua(color: .red)
                .reflection(offsetY: 10)
            Text("🐈")
                .xxlText(1)
                .padding()
                .aqua(color: .yellow)
                .reflection(offsetY: 10)
        }
        .impressMe()
    }
}
