//
//  Movie.swift
//  MoviesApiCombineUiKIt
//
//  Created by Brian Surface on 11/29/24.
//

import Foundation

struct MovieResponse: Decodable{
    let Search: [Movie]
}

struct Movie: Decodable{
    let title: String
    let year: String
    
    
    private enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
    }
}
