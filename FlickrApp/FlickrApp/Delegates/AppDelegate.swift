//
//  AppDelegate.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 19/01/2021.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private let assemblers = Swinject.Assembler([
        ToolsAssembly(),
        NavigationAssembly(),
        UseCasesAssembly(),
        NetworkAssembly(),
        ScenesAssembly()
    ])

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainFlow = assemblers.resolver.resolve(MainFlowProtocol.self)
        window = UIWindow()
        window?.rootViewController = mainFlow?.rootViewController
        window?.makeKeyAndVisible()
        mainFlow?.navigate(to: .start)
        
        return true
    }
}

