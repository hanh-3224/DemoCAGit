//
//  AppViewModel.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation
import RxCocoa
import RxSwift

struct AppViewModel {
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
}

extension AppViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
    }

    func transform(input: AppViewModel.Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        input.loadTrigger
            .drive(onNext: self.navigator.toSearchVC)
            .disposed(by: disposeBag)
        return Output()
    }
}
