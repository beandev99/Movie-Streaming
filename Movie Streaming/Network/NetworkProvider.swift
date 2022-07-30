//
//  NetworkProvider.swift
//  Movie Streaming
//
//  Created by LTT on 30/07/2022.
//

import Foundation
import Moya

final class OnlineProvider {
    fileprivate let provider: MoyaProvider<MultiTarget>
    
    init(endpointClosure: @escaping MoyaProvider<MultiTarget>.EndpointClosure = MoyaProvider<MultiTarget>.defaultEndpointMapping,
         requestClosure: @escaping MoyaProvider<MultiTarget>.RequestClosure = MoyaProvider<MultiTarget>.defaultRequestMapping,
         stubClosure: @escaping MoyaProvider<MultiTarget>.StubClosure = MoyaProvider<MultiTarget>.neverStub,
         session: Session = MoyaProvider<MultiTarget>.defaultAlamofireSession(),
         plugins: [PluginType] = [],
         trackInflights: Bool = false,
         online: Bool = true) {
        self.provider = MoyaProvider(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, session: session, plugins: plugins, trackInflights: trackInflights)
    }
    
    public func request<T: Codable>(_ target: Moya.MultiTarget, type: T.Type, completion: @escaping (Swift.Result<T, BaseError>) -> Void) {
        provider.request(target) { result in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    guard let results = try? JSONDecoder().decode(T.self, from: response.data) else {
                        completion(.failure(.parseResponseDataFalse(title: target.path)))
                        return
                    }
                    DispatchQueue.main.async {
                        completion(.success(results))
                    }
                } else {
                    DispatchQueue.main.async {
                        let error = NSError(domain: target.path, code: response.statusCode, userInfo: nil)
                        completion(.failure(.requestError(title: target.path, message: error.localizedDescription)))
                    }
                }
            case .failure(let error):
                let error = NSError(domain: target.path, code: error.errorCode, userInfo: nil)
                completion(.failure(.requestError(title: target.path, message: error.localizedDescription)))
            }
        }
    }
}
