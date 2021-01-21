//
//  GetFlickrImagesUseCase.swift
//  DomainPlatform
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import RxSwift
import NetworkPlatform

protocol GetFlickrImagesUseCaseProtocol {
    func execute(for searchPhrase: String) -> Single<[FlickrImage]>
}

class GetFlickrImagesUseCase: GetFlickrImagesUseCaseProtocol {
    private let network: NetworkProviderProtocol
    
    init(networkProvider: NetworkProviderProtocol) {
        self.networkProvider = networkProvider
    }
    
    func execute(for searchPhrase: String) -> Single<[FlickrImage]> {
        return .just([])
    }
}
