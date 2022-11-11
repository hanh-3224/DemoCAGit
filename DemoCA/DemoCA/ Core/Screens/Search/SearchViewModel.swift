//
//  SearchViewModel.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation
import RxSwift
import RxCocoa
import RxFlow

struct SearchViewModel: SceneUseCaseViewModel {    
    var sceneUseCase: SearchUseCaseType!
    var steps = PublishRelay<Step>()
    
    struct Input {
        let loadTrigger: Driver<Void>
    }
    struct Output {
        let listData: Driver<[String]>
    }

    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let currentListData = input.loadTrigger
            .withLatestFrom(input.loadTrigger)
            .flatMapLatest { _ in
                return self.sceneUseCase.getMockData().asDriverOnErrorJustComplete()
            }
        
        return Output(listData: currentListData)
    }
}
