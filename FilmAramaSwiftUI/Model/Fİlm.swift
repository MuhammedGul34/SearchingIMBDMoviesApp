//
//  Fİlm.swift
//  FilmAramaSwiftUI
//
//  Created by Muhammed Gül on 28.10.2022.
//

import Foundation

struct Film : Codable {
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    private enum CodinKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct GelenFilmler : Codable {
    let filmler : [Film]
    
    private enum CodingKeys : String, CodingKey {
        case filmler = "Search"
    }
}
