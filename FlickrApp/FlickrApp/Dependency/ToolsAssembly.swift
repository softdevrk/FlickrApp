//
//  ToolsAssembly.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import Swinject

public class ToolsAssembly: Assembly {
    public func assemble(container: Container) {
        container.register(Bundle.self) { _ in
            return Bundle.main
        }

        container.register(BundlerProtocol.self) { resolver in
            return Bundler(bundle: resolver.resolve(Bundle.self)!)
        }

        container.register(SchedulerProviderProtocol.self, factory: { _ in
            return SchedulerProvider()
        })
    }
}
