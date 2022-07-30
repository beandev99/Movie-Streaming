//
//  Configs.swift
//  Movie Streaming
//
//  Created by LTT on 30/07/2022.
//

import Foundation

struct Configs {
    struct Network {
        public static let baseUrl = "https://api.themoviedb.org/3"
        public static let apiKey = "1a7b13f4dfefc55695fcf559add247c6"
        public static let baseUrlYoutube = "https://www.youtube.com/watch?v="
        public static let pathMovieTrending = "/trending/all/day"
        public static let pathMovieTopRated = "/movie/top_rated"
        public static let pathMoviePopular = "/movie/popular"
        public static let pathMovieUpComing = "/movie/upcoming"
        public static let pathMovieNowPlaying = "movie/now_playing"
    }
    
}
