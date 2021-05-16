//
//  HomeContentView.swift
//  MyTVPlayground
//
//  Created by Pedro Antunes on 16/05/2021.
//

import SwiftUI

struct HomeContentView: View {
    @Namespace private var namespace
    @StateObject private var contentController = MyObservable()
    @State private var selected: FilmInfo = .empty
    
    var body: some View {
        HStack {
            ImageWithURL(selected.largeImage ?? selected.image)
                .clipped()
                .scaledToFit()
                .frame(width: 600)
                .frame(maxHeight: .infinity)
                .animation(nil)
            VStack {
                VStack(alignment: .leading) {
                    Text(selected.title)
                        .font(.largeTitle)
                        .padding(.bottom, 30)
                    Text(selected.description)
                        .lineLimit(nil)
                        .multilineTextAlignment(.leading)
                }
                .frame(height: 400, alignment: .top)
                .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
                ScrollView(.vertical) {
                    ForEach(0..<6) { index in
                        VStack {
                            Text("Area \(index)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 30)
                        PosterHorizontalCollectionView(selected: $selected, films: contentController.films)
                            .frame(height: 300, alignment: .bottom)
                        }
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .alignmentGuide(.bottom, computeValue: { dimension in
                    return 0
                })
            }
        }
        .focusScope(namespace)
        .impressMe()
        .onAppear {
            selected = contentController.films.first ?? .empty
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
