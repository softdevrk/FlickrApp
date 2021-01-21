//
//  MainFlow.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 20/01/2021.
//

import Swinject

enum MainNavigationStep {
    case start
}

protocol MainFlowProtocol: DismissProtocol {
    var rootViewController: UINavigationController { get }
    func navigate(to step: MainNavigationStep)
}

class MainFlow: BaseFlow, MainFlowProtocol {
    func navigate(to step: MainNavigationStep) {
        switch step {
        case .start:
            start()
        }
    }
    
    private func start() {
        let viewController = resolver.resolve(MainViewController.self)!
        rootViewController.pushViewController(viewController, animated: true)
    }
}
