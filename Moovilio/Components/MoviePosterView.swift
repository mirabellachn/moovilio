//
//  MoviePosterView.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import SwiftUI

struct MoviePosterView: View {
    let posterPath: String?

    var body: some View {
        AsyncImage(url: url) { image in
            image.resizable().scaledToFill()
        } placeholder: {
            ProgressView()
        }
        .frame(height: 220)
        .clipped()
        .cornerRadius(12)
    }

    private var url: URL? {
        guard let posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")
    }
}



#Preview {
    MoviePosterView(
        posterPath: "/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg"
    )
    .padding()
}

