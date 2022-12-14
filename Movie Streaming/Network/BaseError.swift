//
//  APIError.swift
//  Movie Streaming
//
//  Created by LTT on 30/07/2022.
//

import Foundation

public enum BaseError: Error {
    case parseResponseDataFalse(title: String)
    case requestError(title: String, message: String)
    
    public var description: String {
        switch self {
        case .parseResponseDataFalse:
            return "Parse response data false"
        case.requestError(_, let message):
            return message
        }
    }
    
    public var title: String {
        switch self {
        case .parseResponseDataFalse(let title):
            return title
        case .requestError(let title, _):
            return title
        }
    }
}
