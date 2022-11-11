//
//  SearchFlow.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 16/11/2022.
//

import Foundation
import RxFlow
import UIKit
import RxCocoa
import RxSwift

class Searchflow {
    let disposeBag = DisposeBag()
    let rootViewController = UINavigationController()
    let stepper = OneStepper(withSingleStep: Steps.searchRequired)
    
    private func showSearchScreen() -> FlowContributors {
        let vm = SearchViewModel()
        let usecase = SearchUseCase()
        let vc = SearchViewController.instantiate(viewModel: vm, sceneUseCase: usecase)
        rootViewController.pushViewController(vc, animated: false)
        return vc.flowContributors
    }
}

extension Searchflow: Flow {
    var root: RxFlow.Presentable {
        return self.rootViewController
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? Steps else { return .none }
        switch step {
        case .searchRequired:
            return showSearchScreen()
        default:
            return .none
        }
    }
}
