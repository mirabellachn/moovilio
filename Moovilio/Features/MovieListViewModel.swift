//
//  MovieDetailViewModel.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import Foundation
import Combine

@MainActor
final class MovieListViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    private var page = 1
    @Published var isLoading = false
    @Published var hasError = false
    
    
    func fetchMovies() async {
        guard !isLoading else { return }
        
        isLoading = true
        hasError = false
        
        let urlString =
        "\(APIConfig.baseURL)/movie/popular?api_key=\(APIConfig.apiKey)&page=\(page)"
        
        guard let url = URL(string: urlString) else {
            hasError = true
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
            
            movies.append(contentsOf: decoded.results)
            page += 1
        } catch {
            hasError = true
        }
        
        isLoading = false
    }
}
