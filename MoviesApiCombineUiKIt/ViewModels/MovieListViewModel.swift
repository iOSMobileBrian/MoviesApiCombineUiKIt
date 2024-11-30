//
//  MovieListViewModel.swift
//  MoviesApiCombineUiKIt
//
//  Created by Brian Surface on 11/29/24.
//

import Foundation
import Combine

class MovieListViewModel {
    
    @Published private(set) var movies: [Movie] = []
    @Published var loadingCompleted:Bool = false
    
    private let httpClient: HttpClient
    private var cancellables: Set<AnyCancellable> = []
    private var searchSubject = CurrentValueSubject<String, Never>("")
    
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
        setupSearchPublisher()
    }
    
    private func setupSearchPublisher(){
        searchSubject
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink {[weak self] searchText in
                self?.loadMovies(search: searchText)
            }.store(in: &cancellables)
    }
    
    func setSearchText(_ searchText: String){
        searchSubject.send(searchText)
    }
    
    func loadMovies(search:String){
        httpClient.fetchMovies(search: search)
            .sink {[weak self] completion in
                switch completion{
                case .finished:
                    self?.loadingCompleted = true
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] movies in
                self?.movies = movies
            }.store(in: &cancellables)

    }
}
