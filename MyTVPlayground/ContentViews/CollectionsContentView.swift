//
//  CollectionsContentView.swift
//  MyTVPlayground
//
//  Created by Pedro Antunes on 16/05/2021.
//

import SwiftUI

struct CollectionsContentView: View {
    @Namespace private var namespace
    @StateObject private var contentController = MyObservable()
    @State private var selected: FilmInfo = .empty
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                Spacer(minLength: 80)
                ForEach(0..<6) { index in
                    VStack {
                        Text("Area \(index)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 30)
                        PosterHorizontalCollectionView(selected: $selected, films: contentController.films, imageHeight: 240)
                            .frame(height: 400, alignment: .top)
                    }
                }
            }
        }
    }
}

struct CollectionsContentView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionsContentView()
    }
}
