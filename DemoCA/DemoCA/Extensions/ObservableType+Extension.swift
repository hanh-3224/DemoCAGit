//
//  ObservableType+Extension.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 02/11/2022.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

extension ObservableType {
    public func asDriverOnErrorJustComplete() -> Driver<Element> {
        return asDriver { _ in
            return Driver.empty()
        }
    }
}

