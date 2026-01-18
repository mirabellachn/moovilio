//
//  MovieDetailViewModel.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import Foundation
import Combine

@MainActor
final class MovieDetailViewModel: ObservableObject {

    @Published var reviews: [Review] = []
    @Published var trailerKey: String?

    func fetchReviews(movieId: Int) async {
        let urlString =
        "\(APIConfig.baseURL)/movie/\(movieId)/reviews?api_key=\(APIConfig.apiKey)"

        guard let url = URL(string: urlString) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(ReviewResponse.self, from: data)
            reviews = decoded.results
        } catch {
            reviews = []
        }
    }

    func fetchTrailer(movieId: Int) async {
        let urlString =
        "\(APIConfig.baseURL)/movie/\(movieId)/videos?api_key=\(APIConfig.apiKey)"

        guard let url = URL(string: urlString) else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(VideoResponse.self, from: data)

            trailerKey = decoded.results.first {
                $0.site == "YouTube" && $0.type == "Trailer"
            }?.key
        } catch {
            trailerKey = nil
        }
    }
}
