//
//  MovielistView.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import SwiftUI

struct MovieListView: View {

    @StateObject private var viewModel = MovieListViewModel()

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.hasError {
                    ErrorView(
                        message: "Failed to load movies. Please check your internet connection.",
                        retryAction: {
                            Task {
                                await viewModel.fetchMovies()
                            }
                        }
                    )
                } else {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 16) {

                            ForEach(viewModel.movies) { movie in
                                NavigationLink {
                                    MovieDetailView(movie: movie)
                                } label: {
                                    gridCardView(for: movie)
                                }
                                .buttonStyle(.plain)
                                .onAppear {
                                    loadMoreIfNeeded(movie)
                                }
                            }

                            if viewModel.isLoading {
                                HStack {
                                    Spacer()
                                    ProgressView()
                                        .scaleEffect(1.1)
                                    Spacer()
                                }
                                .padding()
                                .transition(.opacity)
                            }

                            if viewModel.movies.isEmpty && !viewModel.isLoading {
                                VStack(spacing: 8) {
                                    Text("No movies available")
                                        .font(.headline)
                                    Text("Please check your internet connection.")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 40)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Moovilio")
            .navigationBarTitleDisplayMode(.large)
            .task {
                await viewModel.fetchMovies()
            }
        }
    }

    private func gridCardView(for movie: Movie) -> some View {
        VStack(alignment: .leading, spacing: 12) {

            MoviePosterView(posterPath: movie.posterPath)
                .frame(height: 200)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.secondary.opacity(0.15), lineWidth: 1)
                )

            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)
                    .foregroundColor(.primary)

                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }

            Spacer(minLength: 0)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 4)
        )
    }

    private func loadMoreIfNeeded(_ movie: Movie) {
        if movie.id == viewModel.movies.last?.id {
            Task {
                await viewModel.fetchMovies()
            }
        }
    }
}

#Preview {
    MovieListView()
}

