//
//  BaseAPIService.swift
//  Movie Streaming
//
//  Created by LTT on 30/07/2022.
//

import Foundation

class BaseAPIService {
    var provider: OnlineProvider!
    
    public init() {
        provider = OnlineProvider()
    }
}
