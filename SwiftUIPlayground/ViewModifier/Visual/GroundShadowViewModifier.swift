//
//  GroundShadowViewModifier.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 17/04/2021.
//

import SwiftUI

private struct GroundShadowViewModifier: ViewModifier {
    let shadowScale: CGFloat
    let offset: CGSize
    let color: Color
    func body(content: Content) -> some View {
        content
            .background(Rectangle()
                            .mask(content)
                            .offset(offset)
                            .scaleEffect(x: 1.0, y: -shadowScale, anchor: .bottom)
                            .blur(radius: 3)
                            .foregroundColor(color))
    }
}

extension View {
    func groundShadow(_ scale: CGFloat = 0.6, offset: CGSize = .zero, color: Color = .gray) -> some View {
        modifier(GroundShadowViewModifier(shadowScale: scale, offset: offset, color: color))
    }
}


struct FloorShadowViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("🍄")
            .xxlText(3)
            .groundShadow()
    }
}
