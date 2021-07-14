//
//  MovieDataModel.swift
//  Moviez
//
//  Created by Jorge Giannotta on 13/07/21.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    
    @Published var movie = [Movie]()
    
    let baseUrl = "https://whosjorge23.github.io/jsonapi/movie.json"
    
    init() {
        fetchMovie()
    }
    
    func fetchMovie() {
        
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else {return}
            guard let movie = try? JSONDecoder().decode([Movie].self, from: data) else {return}
            
            DispatchQueue.main.async {
                self.movie = movie
            }
        }.resume()
    }
    
    func backgroundColor(forType category: String) -> UIColor {
        switch category {
        case "Adventure/Comedy":
            return .systemRed
        case "os":
            return .systemGreen
        case "development":
            return .systemBlue
        case "ios":
            return .systemYellow
//        case "psychic":
//            return .systemPurple
//        case "normal":
//            return .systemOrange
//        case "ground":
//            return .systemGray
//        case "flying":
//            return .systemTeal
//        case "fairy":
//            return .systemPink
        default:
            return .systemIndigo
        }
    }
    
}

extension Data {
    
    func parseData(removeString string : String) -> Data? {
        
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        
        return data
    }
}
