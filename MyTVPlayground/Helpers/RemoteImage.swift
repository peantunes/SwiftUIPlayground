//
//  RemoteImage.swift
//  MyTVPlayground
//
//  Created by Pedro Antunes on 16/05/2021.
//

import SwiftUI

struct RemoteImage: View {
    
    static var cachedImage: NSCache = NSCache<NSString, NSData>()
    
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }
            
            if let cachedData = RemoteImage.cachedImage.object(forKey: NSString(string: url)) {
                self.data = cachedData as Data
                state = .success
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
                return
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                    RemoteImage.cachedImage.setObject(NSData(data: data), forKey: NSString(string: url))
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }

    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image

    var body: some View {
        selectImage()
            .resizable()
    }

    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}
struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(url: "")
    }
}
