//
//  AppViewModel.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation
import RxCocoa
import RxSwift
import RxFlow

struct AppViewModel: SceneUseCaseViewModel {
    
    var steps = PublishRelay<Step>()
    let coordinator: FlowCoordinator
    var sceneUseCase: AppUseCaseType!
    
    func readyToEmitSteps() {
        self.steps.accept(Steps.tabbarRequired)
    }
}

extension AppViewModel: ViewModel {
    struct Input {
        let loadTrigger: Driver<Void>
    }

    struct Output {
    }

    func transform(_ input: AppViewModel.Input, disposeBag: DisposeBag) -> Output {
    
        let output = Output()
        return output
    }
}
