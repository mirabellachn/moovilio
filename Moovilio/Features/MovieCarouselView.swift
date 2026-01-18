//
//  MovieCarouselView.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import SwiftUI

struct MovieCarouselView: View {

    let movies: [Movie]

    var body: some View {
        TabView {
            ForEach(movies) { movie in
                ZStack(alignment: .bottomLeading) {

                    AsyncImage(url: posterURL(movie.posterPath)) { image in
                        image.resizable().scaledToFill()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                    }
                    .frame(height: 260)
                    .clipped()

                    LinearGradient(
                        colors: [.clear, .black.opacity(0.7)],
                        startPoint: .top,
                        endPoint: .bottom
                    )

                    Text(movie.title)
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                }
                .cornerRadius(16)
                .padding(.horizontal)
            }
        }
        .frame(height: 260)
        .tabViewStyle(.page(indexDisplayMode: .automatic))
    }

    private func posterURL(_ path: String?) -> URL? {
        guard let path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w780\(path)")
    }
}
