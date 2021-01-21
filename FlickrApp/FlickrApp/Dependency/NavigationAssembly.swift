//
//  NavigationAssembly.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 20/01/2021.
//

import Swinject

class NavigationAssembly: Assembly {
    func assemble(container: Container) {
        registerMainFlow(inContainer: container)
    }
    
    private func registerMainFlow(inContainer container: Container) {
        container.register(MainFlowProtocol.self) { resolver in
            return MainFlow(resolver: resolver)
        }
    }
}
