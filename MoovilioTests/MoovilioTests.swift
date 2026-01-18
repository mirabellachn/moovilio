//
//  MoovilioTests.swift
//  MoovilioTests
//
//  Created by Mirabella on 18/01/26.
//

import XCTest
@testable import Moovilio

final class MoovilioTests: XCTestCase {

    func testMovieInitialization() {
        let movie = Movie(
            id: 1,
            title: "Interstellar",
            overview: "Space exploration movie",
            posterPath: "/poster.jpg"
        )

        XCTAssertEqual(movie.id, 1)
        XCTAssertEqual(movie.title, "Interstellar")
        XCTAssertEqual(movie.overview, "Space exploration movie")
        XCTAssertEqual(movie.posterPath, "/poster.jpg")
    }
}
