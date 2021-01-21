//
//  ScenesAssembly.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 20/01/2021.
//

import Swinject
import DomainPlatform

public class ScenesAssembly: Assembly {
    public func assemble(container: Container) {
        registerMainScene(inContainer: container)
    }
    
    private func registerMainScene(inContainer container: Container) {
        container.register(MainViewModelProtocol.self) { resolver in
            let getFlickrImagesUseCase = resolver.resolve(GetFlickrImagesUseCaseProtocol.self)!
            return MainViewModel(getFlickrImagesUseCase: getFlickrImagesUseCase)
        }
        
        container.register(MainViewController.self) { resolver in
            let viewModel = resolver.resolve(MainViewModelProtocol.self)!
            let flow = resolver.resolve(MainFlowProtocol.self)!
            return MainViewController(viewModel: viewModel, flow: flow)
        }
    }
}
