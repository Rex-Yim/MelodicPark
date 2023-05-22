//
//  iTunesAPI.swift
//  MelodicPark
//
//  Created by 嚴富莊 on 22/5/2023.
//

import Foundation

let baseURL = "https://itunes.apple.com/"

enum APIError: Error {
    case invalidURL
    case noData
}

func buildSearchURL(query: String, country: String, mediaType: String, offset: Int, limit: Int) -> URL? {
    let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    let safeEncodedQuery = encodedQuery ?? ""
    let urlString = "\(baseURL)search?term=\(safeEncodedQuery)&country=\(country)&media=\(mediaType)&offset=\(offset)&limit=\(limit)"
    return URL(string: urlString)
}

func search(query: String, country: String, mediaType: String, offset: Int, limit: Int, completion: @escaping (Result<[MusicItem], Error>) -> Void) {
    guard let url = buildSearchURL(query: query, country: country, mediaType: mediaType, offset: offset, limit: limit) else {
        completion(.failure(APIError.invalidURL))
        return
    }
    print("Request URL: \(url)")

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
            return
        }

        guard let data = data else {
            completion(.failure(APIError.noData))
            return
        }

        do {
            print(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")
            let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
            completion(.success(searchResponse.results))
        } catch {
            completion(.failure(error))
        }
    }

    task.resume()
}
