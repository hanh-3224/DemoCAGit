//
//  Bindable.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation
import UIKit

public protocol Bindable: AnyObject {

    associatedtype ViewModel

    var viewModel: Self.ViewModel! { get set }

    func bindViewModel()
}

extension Bindable where Self: UIViewController {

    public func bindViewModel(to model: Self.ViewModel) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}

extension Bindable where Self: UITabBarController {
    public func bindViewModel(to model: Self.ViewModel) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
