//
//  Movie.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import Foundation

struct Movie: Identifiable, Codable, Equatable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
}
