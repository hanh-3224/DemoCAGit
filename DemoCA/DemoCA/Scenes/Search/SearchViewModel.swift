//
//  SearchViewModel.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation
import RxSwift

struct SearchViewModel {
    let navigator: SearchNavigatorType
    let useCase: SearchUseCaseType
}

extension SearchViewModel: ViewModelType {
    struct Input {

    }
    struct Output {

    }

    func transform(input: Input, disposeBag: DisposeBag) -> Output {
        return Output()
    }
}
