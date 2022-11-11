//
//  AppDelegate.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import UIKit
import RxSwift
import RxCocoa
import RxFlow

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private let disposeBag = DisposeBag()
    private var viewModel: AppViewModel!
    private var coordinator = FlowCoordinator()
    
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        bindViewModel()
        configFlows()
        return true
    }
    
    private func configFlows() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        let appFlow = AppFlow(window: window)
        Flows.use(appFlow, when: .created) { [weak self] (root) in
            self?.window?.rootViewController = root
            self?.window?.makeKeyAndVisible()
        }
        self.coordinator.coordinate(flow: appFlow, with: viewModel)
    }
}

extension AppDelegate {
    func bindViewModel() {
        let usecase = AppUseCase()
        viewModel = AppViewModel(coordinator: coordinator, sceneUseCase: usecase)
    }
}
