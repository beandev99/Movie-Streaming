//
//  MovieAPI.swift
//  Movie Streaming
//
//  Created by LTT on 30/07/2022.
//

import Foundation
import Moya

enum MovieAPI {
    case getMovieTrending(page: Int)
    case getMovieTopRated(page: Int)
    case getMoviePopular(page: Int)
    case getMovieUpComing(page: Int)
    case getMovieNowPlaying(page: Int)
}

extension MovieAPI: TargetType {
    var baseURL: URL {
        let url = URL(string: Configs.Network.baseUrl)!
        return url
    }
    
    var path: String {
        switch self {
        case .getMovieTrending:
            return Configs.Network.pathMovieTrending
        case .getMovieTopRated:
            return Configs.Network.pathMovieTopRated
        case .getMoviePopular:
            return Configs.Network.pathMoviePopular
        case .getMovieUpComing:
            return Configs.Network.pathMovieUpComing
        case .getMovieNowPlaying:
            return Configs.Network.pathMovieNowPlaying
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var parameters: [String: Any]? {
        var params: [String: Any] = [:]
        switch self {
        case .getMovieTrending(let page), .getMovieTopRated(page: let page), .getMoviePopular(page: let page), .getMovieUpComing(page: let page), .getMovieNowPlaying(page: let page):
            params["api_key"] = Configs.Network.apiKey
            params["page"] = page
        }
        return params
    }
    
    var task: Task {
        switch self {
        case .getMovieTrending, .getMovieTopRated, .getMoviePopular, .getMovieUpComing, .getMovieNowPlaying:
            if let parameters = parameters {
                return .requestParameters(parameters: parameters, encoding: parameterEncoding)
            }
        }
        return .requestPlain
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
}
