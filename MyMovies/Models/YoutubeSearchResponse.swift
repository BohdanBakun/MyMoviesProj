//
//  YoutubeSearchResponse.swift
//  MyMovies
//
//  Created by Богдан Бакун on 20.06.2023.
//

import Foundation

// MARK: - YoutubeSearchResponse
struct YoutubeSearchResponse: Codable {
//    let kind: String?
//    let etag: String?
//    let nextPageToken: String?
//    let regionCode: String?
//    let pageInfo: PageInfo?
    let items: [VideoElement]
}

// MARK: - VideoElement
struct VideoElement: Codable {
//    let kind: String?
//    let etag: String?
    let id: IdVideoElement
}

// MARK: - IdVideoElement
struct IdVideoElement: Codable {
    let kind: String?
    let videoID: String
    
    enum CodingKeys: String, CodingKey {
        case kind
        case videoID = "videoId"
    }
}

// MARK: - PageInfo
struct PageInfo: Codable {
    let totalResults: Int?
    let resultsPerPage: Int?
}
