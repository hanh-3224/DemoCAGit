//
//  SearchAssembler.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import UIKit

protocol SearchAssembler {
    func resolve(navigationController: UINavigationController) -> SearchViewController
    func resolve(navigationController: UINavigationController) -> SearchViewModel
    func resolve(navigationController: UINavigationController) -> SearchNavigatorType
    func resolve() -> SearchUseCaseType
}

extension SearchAssembler {
    func resolve(navigationController: UINavigationController) -> SearchViewController {
        let vc = SearchViewController()
        let vm: SearchViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }

    func resolve(navigationController: UINavigationController) -> SearchViewModel {
        return SearchViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension SearchAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> SearchNavigatorType {
        return SearchNavigator(assembler: self, navigationController: navigationController)
    }

    func resolve() -> SearchUseCaseType {
        return SearchUseCase()
    }
}
