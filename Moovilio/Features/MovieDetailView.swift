//
//  MovieDetailView.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import SwiftUI

struct MovieDetailView: View {

    let movie: Movie
    @StateObject private var viewModel = MovieDetailViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                if let poster = movie.posterPath {
                    AsyncImage(
                        url: URL(string: "\(APIConfig.imageBaseURL)\(poster)")
                    ) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .cornerRadius(16)
                }

                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(movie.overview)
                    .font(.body)
                    .foregroundStyle(.secondary)

                if let trailerKey = viewModel.trailerKey {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Trailer")
                            .font(.headline)

                        YouTubeView(videoKey: trailerKey)
                            .frame(height: 220)
                            .cornerRadius(12)
                    }
                }

                if !viewModel.reviews.isEmpty {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Reviews")
                            .font(.headline)

                        ForEach(viewModel.reviews.prefix(3)) { review in
                            VStack(alignment: .leading, spacing: 6) {
                                Text(review.author)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)

                                Text(review.content)
                                    .font(.footnote)
                                    .foregroundStyle(.secondary)
                                    .lineLimit(5)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchTrailer(movieId: movie.id)
            await viewModel.fetchReviews(movieId: movie.id)
        }
    }
}


#Preview {
    NavigationStack {
        MovieDetailView(
            movie: Movie(
                id: 1,
                title: "Interstellar",
                overview: "A team of explorers travel through a wormhole in space.",
                posterPath: "/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg"
            )
        )
    }
}
