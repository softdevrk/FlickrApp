//
//  UseCasesAssembly.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import Swinject
import NetworkPlatform
import DomainPlatform

public class UseCasesAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(GetFlickrImagesUseCaseProtocol.self) { resolver in
            let networkProvider = resolver.resolve(NetworkProviderProtocol.self)!
            let apiKey = resolver.resolve(BundlerProtocol.self)!.flickrApiKey

            return GetFlickrImagesUseCase(networkProvider: networkProvider, flickrApiKey: apiKey)
        }
    }
}
