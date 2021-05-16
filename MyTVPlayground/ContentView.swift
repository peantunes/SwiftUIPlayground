//
//  ContentView.swift
//  MyTVPlayground
//
//  Created by Pedro Antunes on 16/05/2021.
//

import SwiftUI

class MyObservable: ObservableObject {
    @Published var films: [FilmInfo] = []
    let loader: FileLoader
    init() {
        loader = FileLoader()
        films = loader.loadContent("filmContent") ?? []
    }
}

struct FocusedMenuBinding: FocusedValueKey {
    typealias Value = Binding<Int>
}

extension FocusedValues {
    var menuBinding: FocusedMenuBinding.Value? {
        get { self[FocusedMenuBinding.self] }
        set { self[FocusedMenuBinding.self] = newValue }
    }
}

struct ContentView: View {
    @FocusedBinding(\.menuBinding) var menu
    @Namespace private var menuItems
    @State private var currentTab: Int = 0
    
    var body: some View {
        ZStack(alignment: .top) {
            switch currentTab {
            case 0:
                HomeContentView()
                    .transition(AnyTransition.move(edge: .trailing))
                    .animation(.easeIn)
                
            case 1:
                CollectionsContentView()
                    .transition(AnyTransition.move(edge: .trailing))
                    .animation(.easeIn)
                
            case 2:
                CollectionsContentView()
                    .transition(AnyTransition.move(edge: .trailing))
                    .animation(.easeIn)
            default:
                Text("none")
                    .transition(.slide)
                    .animation(.easeIn)
            }
            HStack {
                Spacer()
                    .prefersDefaultFocus(false, in: menuItems)
                
                Text("Item 1")
                    .simpleFocus { focused in
                        if focused {
                            currentTab = 0
                        }
                    }
                    .prefersDefaultFocus(in: menuItems)
                
                Text("Item 2")
                    .simpleFocus { focused in
                        if focused {
                            currentTab = 1
                        }
                    }
                
                Text("Item 3")
                    .simpleFocus { focused in
                        if focused {
                            currentTab = 2
                        }
                    }
                
                Spacer()
                    .prefersDefaultFocus(false, in: menuItems)
            }
            .focusedValue(\.menuBinding, $currentTab)
            .frame(maxWidth: .infinity)
            .background(Color.red)
            .focusScope(menuItems)
        }
        .impressMe()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
