//
//  Network.swift
//  NetworkPlatform
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import Alamofire
import RxAlamofire
import RxSwift

public final class Network {
    private let url: String
    private let jsonDecoder: JSONDecoder
    private let scheduler: ImmediateSchedulerType
    
    public init(_ url: String, _ jsonDecoder: JSONDecoder, _ scheduler: ImmediateSchedulerType) {
        self.url = url
        self.jsonDecoder = jsonDecoder
        self.scheduler = scheduler
    }
    
    public func get<T: Decodable>(_ path: String, parameters: [String: AnyHashable]?) -> Single<T> {
        let absolutePath = "\(url)/\(path)"
        return RxAlamofire
            .data(.get, absolutePath, parameters: parameters)
            .debug()
            .observeOn(scheduler)
            .map({ data -> T in
                return try self.jsonDecoder.decode(T.self, from: data)
            }).asSingle()
    }
}
