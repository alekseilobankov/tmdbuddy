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

func violateSwiftlintAgain() {
    let forceCastExample = 2 as! Double
}
