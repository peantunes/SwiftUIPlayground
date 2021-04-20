//
//  FloatingAnimatableModifier.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 17/04/2021.
//

import SwiftUI

struct FloatingAnimatableModifier: AnimatableModifier {
    var value: CGFloat
    var scale: CGFloat
    init(active: Bool) {
        value = active ? 0 : 13
        scale = active ? 0.6 : 0.4
    }
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { AnimatablePair(value, scale)  }
        set {
            value = newValue.first
            scale = newValue.second
        }
    }
    func body(content: Content) -> some View {
        let sinValue = sin(value)
        let cosValue = cos(value)
        return content
            .offset(x: sinValue*2, y: cosValue*2)
            .groundShadow((sinValue*0.05)+0.4, offset: CGSize(width: 0, height: -(5*(sinValue))), color: Color.black.opacity(0.3))
    }
}

extension View {
    func floating(_ active: Bool = true) -> some View {
        modifier(FloatingAnimatableModifier(active: active))
    }
}

struct FloatingAnimatableModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("🌋")
            .xxlText(3)
            .floating()
            .animation(Animation.easeInOut(duration: 2).repeatForever())
    }
}
