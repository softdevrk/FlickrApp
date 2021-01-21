//
//  BaseFlow.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 20/01/2021.
//

import Swinject

protocol DismissProtocol {
    func dismiss()
}

class BaseFlow: DismissProtocol {
    let resolver: Resolver
    var rootViewController: UINavigationController = {
        var navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: false)
        return navigationController
    }()

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func dismiss() {
        rootViewController.popViewController(animated: true)
    }
}
