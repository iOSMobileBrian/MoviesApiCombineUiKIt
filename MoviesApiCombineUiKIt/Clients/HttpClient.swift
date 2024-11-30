//
//  HttpClient.swift
//  MoviesApiCombineUiKIt
//
//  Created by Brian Surface on 11/29/24.
//

import Foundation
import Combine

enum NetworkError: Error{
    case badRequest
}

class HttpClient {
    
    func fetchMovies(search: String) -> AnyPublisher<[Movie], Error> {
        
        guard let encodedSearch = search.urlEncoded else {
            return Fail(error: NetworkError.badRequest).eraseToAnyPublisher()
        }
        
        let url = URL(string: "https://www.ombapi.com/?s=\(encodedSearch)&page=2&apiKey=\(apiKey)")
        
        return URLSession.shared.dataTaskPublisher(for: url!)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .map(\.Search)
            .receive(on: DispatchQueue.main)
            .catch { error -> AnyPublisher<[Movie], Error> in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
        
        
    }
}
