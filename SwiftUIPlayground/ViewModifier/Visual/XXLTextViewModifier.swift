//
//  XXLTextViewModifier.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 17/04/2021.
//

import SwiftUI

private struct XXLTextViewModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.system(size: size*40))
    }
}

extension View {
    func xxlText(_ size: CGFloat = 2) -> some View {
        modifier(XXLTextViewModifier(size: size))
    }
}


struct XXLTextViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("🌴")
            .xxlText(3)
            .groundShadow()
    }
}
