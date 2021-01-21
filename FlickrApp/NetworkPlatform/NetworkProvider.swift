//
//  NetworkProvider.swift
//  NetworkPlatform
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import RxSwift
import Alamofire
import RxAlamofire

fileprivate enum Endpoints: String {
    case images = "rest/"
}

public protocol NetworkProviderProtocol {
    func getImages(for searchPhrase: String, with apiKey: String) -> Single<FlickrImagesResponse>
}

public class NetworkProvider: NetworkProviderProtocol {
    private let network: Network
    
    public init(_ network: Network) {
        self.network = network
    }
    
    public func getImages(for searchPhrase: String, with apiKey: String) -> Single<FlickrImagesResponse> {
        let parameters: [ String: AnyHashable] = [
            "api_key": apiKey,
            "text": searchPhrase,
            "method": "flickr.photos.search",
            "format": "json",
            "nojsoncallback": 1
        ]
        
        return network.get(Endpoints.images.rawValue, parameters: parameters)
    }
}
