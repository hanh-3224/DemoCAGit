//
//  AppNavigator.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import UIKit

protocol AppNavigatorType {
    func toSearchVC()
}

struct AppNavigator: AppNavigatorType {
    unowned let assembler: Assembler
    unowned let window: UIWindow

    func toSearchVC() {
        let nav = UINavigationController()
        let searchVC: SearchViewController = assembler.resolve(navigationController: nav)
        nav.setViewControllers([searchVC], animated: false)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
