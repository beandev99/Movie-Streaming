//
//  MovieAPIService.swift
//  Movie Streaming
//
//  Created by LTT on 30/07/2022.
//

import Foundation
import Moya

protocol MovieAPIServiceProtocol {
    func getMovieTrending(page: Int, completion: @escaping (Swift.Result<MovieResponse, BaseError>) -> Void)
    func getMovieTopRated(page: Int, completion: @escaping (Swift.Result<MovieResponse, BaseError>) -> Void)
    func getMoviePopular(page: Int, completion: @escaping (Swift.Result<MovieResponse, BaseError>) -> Void)
    func getMovieUpComing(page: Int, completion: @escaping (Swift.Result<MovieResponse, BaseError>) -> Void)
    func getMovieNowPlaying(page: Int, completion: @escaping (Swift.Result<MovieResponse, BaseError>) -> Void)
}

class MovieAPIService: BaseAPIService, MovieAPIServiceProtocol {
    func getMovieTrending(page: Int, completion: @escaping (Swift.Result<MovieResponse, BaseError>) -> Void) {
        provider.request(Moya.MultiTarget(MovieAPI.getMovieTrending(page: page)), type: MovieResponse.self) { result in
            completion(result)
        }
    }
    
    func getMovieTopRated(page: Int, completion: @escaping (Swift.Result<MovieResponse, BaseError>) -> Void) {
        provider.request(Moya.MultiTarget(MovieAPI.getMovieTopRated(page: page)), type: MovieResponse.self) { result in
            completion(result)
        }
    }
    
    func getMoviePopular(page: Int, completion: @escaping (Swift.Result<MovieResponse, BaseError>) -> Void) {
        provider.request(Moya.MultiTarget(MovieAPI.getMoviePopular(page: page)), type: MovieResponse.self) { result in
            completion(result)
        }
    }
    
    func getMovieUpComing(page: Int, completion: @escaping (Swift.Result<MovieResponse, BaseError>) -> Void) {
        provider.request(Moya.MultiTarget(MovieAPI.getMovieUpComing(page: page)), type: MovieResponse.self) { result in
            completion(result)
        }
    }
    
    func getMovieNowPlaying(page: Int, completion: @escaping (Swift.Result<MovieResponse, BaseError>) -> Void) {
        provider.request(Moya.MultiTarget(MovieAPI.getMovieNowPlaying(page: page)), type: MovieResponse.self) { result in
            completion(result)
        }
    }
}
