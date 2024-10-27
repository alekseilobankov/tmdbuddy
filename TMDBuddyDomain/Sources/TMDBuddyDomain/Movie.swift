//
//  Movie.swift
//  TMDBuddyDomain
//
//  Created by Aleksei Lobankov on 09.10.2024.
//

import struct Foundation.Date

struct Movie {
    let id: Int
    let title: String
    let originalTitle: String
    let overview: String
    let posterPath: String
    let backdropPath: String
    let originalLanguage: String
    let genreIDs: [Int]
    let popularity: Double
    let releaseDate: Date
    let voteAverage: Double
    let voteCount: Int
}

func shouldNotViolateSwiftlint() {
    let formattingViolation :Int=   5
    print ( formattingViolation )

}

func shouldViolateSwiftlint() {
    let lineLengthViolation = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

    let forceCastViolation = 2 as! Double

    let optionalInt: Int? = 3
    let forceUnwrappingViolation = optionalInt!

    func dummyThrowingFunc() throws { throw CancellationError() }
    let forceTryViolation = try! dummyThrowingFunc()
}
