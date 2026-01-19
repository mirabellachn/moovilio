//
//  MoviePosterView.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import SwiftUI

struct MoviePosterView: View {
    let posterPath: String?
    var aspectRatio: CGFloat = 2 / 3   

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()

            case .failure(_):
                placeholder

            case .empty:
                placeholder

            @unknown default:
                placeholder
            }
        }
        .aspectRatio(aspectRatio, contentMode: .fit)
        .clipped()
        .cornerRadius(12)
    }

    private var placeholder: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.secondary.opacity(0.15))
            .overlay {
                ProgressView()
            }
    }

    private var url: URL? {
        guard let posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}


#Preview {
    MoviePosterView(
        posterPath: "//gEU2QniE6E77NI6lCU6MxlNBvIx.jpg"
    )
    .padding()
}

