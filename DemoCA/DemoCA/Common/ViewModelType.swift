//
//  ViewModelType.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation
import RxSwift
import RxFlow

// MARK: - ViewModel

protocol ViewModel: Stepper {
    associatedtype Input
    associatedtype Output
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output
}

// ViewModel include SceneUseCase
protocol SceneUseCaseViewModel: ViewModel {
    associatedtype SceneUseCase
    var sceneUseCase: SceneUseCase! { get set }
}

protocol ViewModelBased: AnyObject {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

// MARK: - Extensions
extension ViewModelBased where Self: UIViewController {
    static func instantiate<ViewModelType>(viewModel: ViewModelType) -> Self where ViewModelType == Self.ViewModelType {
        let vc = Self(nibName: String(describing: Self.self), bundle: nil)
        vc.viewModel = viewModel
        vc.loadViewIfNeeded()
        vc.bindViewModel()
        return vc
    }
}

extension ViewModelBased where Self: UIViewController, ViewModelType: SceneUseCaseViewModel {
    static func instantiate<ViewModelType, SceneUseCaseType> (viewModel: ViewModelType, sceneUseCase: SceneUseCaseType) -> Self
        where ViewModelType == Self.ViewModelType, SceneUseCaseType == Self.ViewModelType.SceneUseCase {
            let vc = Self(nibName: String(describing: Self.self), bundle: nil)
            vc.viewModel = viewModel
            vc.viewModel.sceneUseCase = sceneUseCase
            vc.loadViewIfNeeded()
            vc.bindViewModel()
            return vc
    }
}

extension ViewModelBased where Self: UITabBarController, ViewModelType: SceneUseCaseViewModel {
    static func instantiate<ViewModelType, SceneUseCaseType> (viewModel: ViewModelType, sceneUseCase: SceneUseCaseType) -> Self
        where ViewModelType == Self.ViewModelType, SceneUseCaseType == Self.ViewModelType.SceneUseCase {
            let vc = Self()
            vc.viewModel = viewModel
            vc.viewModel.sceneUseCase = sceneUseCase
            vc.loadViewIfNeeded()
            vc.bindViewModel()
            return vc
    }
}

extension ViewModelBased where Self: UIViewController {
    var flowContributors: FlowContributors {
        return FlowContributors.one(flowContributor: FlowContributor.contribute(withNextPresentable: self, withNextStepper: self.viewModel))
    }

    func flowContributors(_ stepper: Stepper?) -> FlowContributors {
        let steppers = CompositeStepper(steppers: [self.viewModel, stepper].compactMap { $0 })
        return FlowContributors.one(flowContributor: FlowContributor.contribute(withNextPresentable: self, withNextStepper: steppers))
    }
}

