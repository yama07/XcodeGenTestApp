//
//  PetstoreApiProvider.swift
//  Petstore
//
//  Created by Yamamoto on 2020/02/16.
//

import Foundation
import Moya

public class PetstoreApiProvider {
    public static let shared = PetstoreApiProvider()
    private let provider = MoyaProvider<MultiTarget>()
    
    @discardableResult
    public func request<T>(_ request: T,
                           completion: @escaping (_ result: Result<T.Response, Error>) -> Void) -> Cancellable where T: PetstoreApiTargetType {
        let target = MultiTarget(request)
        return provider.request(target) {
            switch $0 {
            case let .success(response):
                do {
                    let responseData = (response.data.isEmpty && T.Response.self == NoBody.self) ?
                        "{}".data(using: .utf8)! : response.data
                    let parsed = try JSONDecoder().decode(T.Response.self, from: responseData)
                    completion(.success(parsed))
                } catch {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
