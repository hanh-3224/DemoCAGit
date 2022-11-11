//
//  AppFlow.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 10/11/2022.
//

import UIKit
import RxFlow
import RxSwift
import RxCocoa

enum TabFlowType {
    case home
    case search
}
class AppFlow {
    private var rootViewController = UINavigationController()
    private let window: UIWindow
    private let tabbarViewController = UITabBarController()
    private let disposeBag = DisposeBag()
    private let baseSteps = PublishRelay<Step>()
    
    init(window: UIWindow) {
        self.window = window
    }

    private func showTabbarFlow() -> FlowContributors {
        let searchFlow = Searchflow()
        rootViewController.viewControllers = [tabbarViewController]
        Flows.use(searchFlow, when: .created) { [weak self] searchRoot in
            let searchTabbarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
            searchRoot.tabBarItem = searchTabbarItem
            self?.tabbarViewController.setViewControllers([searchRoot], animated: false)
        }
        let contributors : [FlowContributor] = [
            .contribute(withNextPresentable: searchFlow,
                        withNextStepper: OneStepper(withSingleStep: Steps.searchRequired))]
        return FlowContributors.multiple(flowContributors: contributors)
    }
}

extension AppFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
        
    func navigate(to step: Step) -> FlowContributors {
        guard let state = step as? Steps else { return FlowContributors.none }
        switch state {
        
        case .tabbarRequired:
            return showTabbarFlow()
        default:
            return .none
        }
    }
}
