//
//  TMDBService.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import Foundation

enum TMDBError: Error {
    case invalidURL
    case noData
}

final class TMDBService {

    static let shared = TMDBService()
    private init() {}

    func fetchPopularMovies(page: Int = 1) async throws -> [Movie] {
        guard let url = URL(
            string: "\(APIConfig.baseURL)/movie/popular?api_key=\(APIConfig.apiKey)&page=\(page)"
        ) else {
            throw TMDBError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
        return decoded.results
    }
}
