//
//  Review.swift
//  Moovilio
//
//  Created by Mirabella on 18/01/26.
//

import Foundation

struct Review: Identifiable, Codable {
    let id: String
    let author: String
    let content: String
}
