//
//  PosterHorizontalCollectionView.swift
//  MyTVPlayground
//
//  Created by Pedro Antunes on 16/05/2021.
//

import SwiftUI

struct PosterHorizontalCollectionView: View {
    @Binding var selected: FilmInfo
    let films: [FilmInfo]
    var imageHeight: CGFloat = 160
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(films) { film in
                    VStack {
                        ImageWithURL(film.image)
                            .scaledToFit()
                            .frame(height: imageHeight)
                            .reflection()
                    }
                    .padding()
                    .simpleFocus({ newSelection in
                        if newSelection {
                            selected = film
                        }
                        
                    }, onSelect: {
                        selected = film
                    })
                }
            }
        }
        .frame(height: 400, alignment: .bottom)
    }
}

struct PosterHorizontalCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        PosterHorizontalCollectionView(selected: .constant(.empty), films: [])
    }
}
