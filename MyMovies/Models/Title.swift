//
//  Title.swift
//  MyMovies
//
//  Created by Богдан Бакун on 15.06.2023.
//

import Foundation

//struct TrendingTitleResponse: Codable {
//    let results: [Title]
//}
//
//// MARK: - Result
//struct Title: Codable {
////    let adult: Bool?
////    let backdropPath: String?
//    let id: Int?
//    let name: String?
//    let title: String?
////    let originalLanguage: String?
////    let originalName: String?
//    let overview: String?
//    let posterPath: String?
//    let mediaType: String?
////    let genreIDS: [Int]?
////    let popularity: Double?
////    let firstAirDate: String?
//    let voteAverage: Double?
//    let voteCount: Int?
////    let originCountry: [String]?
//
//    enum CodingKeys: String, CodingKey {
////        case adult
////        case backdropPath = "backdrop_path"
//        case id
//        case name
//        case title
////        case originalLanguage = "original_language"
////        case originalName = "original_name"
//        case overview
//        case posterPath = "poster_path"
//        case mediaType = "media_type"
////        case genreIDS = "genre_ids"
////        case popularity
////        case firstAirDate = "first_air_date"
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
////        case originCountry = "origin_country"
//    }
//}

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
