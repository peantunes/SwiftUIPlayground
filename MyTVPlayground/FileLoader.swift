//
//  FileLoader.swift
//  MyTVPlayground
//
//  Created by Pedro Antunes on 16/05/2021.
//

import Foundation

/*
 var result = $(".lister .lister-item").map(function () {
 let img =  $(this).find("img")
 return {title: img.attr("alt"),
     image: img.attr("src"),
     year: $(this).find(".lister-item-year").text(),
     genre: $(this).find(".genre").text(),
     certificate: $(this).find(".certificate").text(),
     description: $(this).find("p.text-muted").get(1).innerText}
 })
 */

struct FileLoader {
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse<T: Decodable>(jsonData: Data) -> T? {
        do {
            return try JSONDecoder().decode(T.self,
                                                       from: jsonData)
            
        } catch let error {
            print(error)
            return nil
        }
    }
    
    func loadContent<T: Decodable>(_ fileName: String) -> T? {
        guard let data = readLocalFile(forName: fileName) else {
            return nil
        }
        return parse(jsonData: data)
    }
}

struct FilmInfo: Codable {
    let title: String
    let description: String
    let image: String
    let largeImage: String?
    let genre: String
    let year: String
    let certificate: String
}

extension FilmInfo: Identifiable {
    var id: String {
        title
    }
    
    static var empty = FilmInfo(title: "", description: "", image: "", largeImage: "", genre: "", year: "", certificate: "")
}
