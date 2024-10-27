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

func violatesSwiftlint() {
    let dummyCast = 3 as! Double
    let secondDummyCast = 3 as! Double
    let secondDummyCast2 = 3 as! Double
}
