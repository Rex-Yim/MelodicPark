//
//  DataModel.swift
//  MelodicPark
//
//  Created by 嚴富莊 on 22/5/2023.
//

import Foundation

struct MusicItem: Codable {
    let artistId: Int
    let artistName: String
    let trackId: Int?
    let trackName: String?
    let collectionId: Int?
    let collectionName: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let previewUrl: String?
    let primaryGenreName: String?
}

struct SearchResponse: Codable {
    let resultCount: Int
    let results: [MusicItem]
}
