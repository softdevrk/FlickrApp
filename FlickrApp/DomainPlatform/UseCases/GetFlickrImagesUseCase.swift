//
//  GetFlickrImagesUseCase.swift
//  DomainPlatform
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import RxSwift
import NetworkPlatform

public protocol GetFlickrImagesUseCaseProtocol {
    func execute(for searchPhrase: String) -> Single<[FlickrImage]>
}

public class GetFlickrImagesUseCase: GetFlickrImagesUseCaseProtocol {
    private let networkProvider: NetworkProviderProtocol
    private let flickrApiKey: String
    
    public init(networkProvider: NetworkProviderProtocol, flickrApiKey: String) {
        self.networkProvider = networkProvider
        self.flickrApiKey = flickrApiKey
    }
    
    public func execute(for searchPhrase: String) -> Single<[FlickrImage]> {
        return networkProvider
            .getImages(for: searchPhrase, with: flickrApiKey)
            .map { $0.photos }
            .map { results in
                return results.photo.compactMap {
                    FlickrImage(imageResponse: $0)
                }
            }
    }
}

