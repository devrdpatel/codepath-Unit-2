//
//  Movies.swift
//  flixster
//
//  Created by Anderson David on 1/20/23.
//

import Foundation

struct MoviesResponse: Decodable {
    static var allData: [Movie] = [Movie]()
    var results: [Movie]
    
    
    // The below is used to load locally stored json data
    /*
    static func loadJson() -> [Movie] {
        if let url = Bundle.main.url(forResource: "data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let jsonData = try decoder.decode(MoviesResponse.self, from: data)
                allData = jsonData.results
                return jsonData.results
            } catch {
                print("error:\(error)")
            }
        }
        return []
    }
    */
}

struct Movie: Decodable {
    var originalTitle: String
    var overview: String
    var id: Int64
    
    var posterPath: String // when loading image with Nuke, make sure you convert to url by prepending base url
    static var posterBaseURLString185: String = "https://image.tmdb.org/t/p/w185"
    static var posterBaseURLString200: String = "https://image.tmdb.org/t/p/w400"
    static var backdropBaseURLString: String = "https://image.tmdb.org/t/p/w500"
    var backdropPath: String
    var voteAverage: Double
    var voteCount: Int
    var popularity: Double
}


