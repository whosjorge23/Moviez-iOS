//
//  Movie.swift
//  Moviez
//
//  Created by Jorge Giannotta on 13/07/21.
//

import Foundation

struct Movie : Decodable, Identifiable {
    let id : Int
    let title : String
    let imageUrl : String
    let category : String
    let year : String
    let trailer : String
}
