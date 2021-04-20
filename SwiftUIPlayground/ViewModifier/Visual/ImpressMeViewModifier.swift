//
//  ImpressMeViewModifier.swift
//  SwiftUIPlayground
//
//  Created by Pedro Antunes on 17/04/2021.
//

import SwiftUI

private struct ImpressMeViewModifier: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
        ZStack {
            color
                .edgesIgnoringSafeArea(.all)
            content
        }
    }
}

extension View {
    func impressMe(color: Color = .black) -> some View {
        modifier(ImpressMeViewModifier(color: color))
    }
}

struct ImpressMeViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Pedro")
            .foregroundColor(.white)
            .impressMe()
    }
}
