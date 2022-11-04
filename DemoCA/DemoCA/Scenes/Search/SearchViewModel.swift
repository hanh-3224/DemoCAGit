//
//  SearchViewModel.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation
import RxSwift
import RxCocoa

struct SearchViewModel {
    let navigator: SearchNavigatorType
    let useCase: SearchUseCaseType
}

extension SearchViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    struct Output {
        let listData: Driver<[String]>
    }

    func transform(input: Input, disposeBag: DisposeBag) -> Output {
        let currentListData = input.loadTrigger
            .withLatestFrom(input.loadTrigger)
            .flatMapLatest { _ in
                return self.useCase.getMockData().asDriverOnErrorJustComplete()
            }
        
        return Output(listData: currentListData)
    }
}
