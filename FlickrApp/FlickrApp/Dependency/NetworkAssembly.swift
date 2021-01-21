//
//  NetworkAssembly.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import Swinject
import NetworkPlatform

class NetworkAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(JSONDecoder.self) { _ in
            return JSONDecoder()
        }
        
        container.register(Network.self) { resolver in
            let url = resolver.resolve(BundlerProtocol.self)!.apiUrl
            let decoder = resolver.resolve(JSONDecoder.self)!
            let scheduler = resolver.resolve(SchedulerProviderProtocol.self)!.comptutation()
            return Network(url, decoder, scheduler)
        }.inObjectScope(.container)
        
        container.register(NetworkProviderProtocol.self) { resolver in
            let network = resolver.resolve(Network.self)!
            return NetworkProvider(network)
        }.inObjectScope(.container)
    }
}
