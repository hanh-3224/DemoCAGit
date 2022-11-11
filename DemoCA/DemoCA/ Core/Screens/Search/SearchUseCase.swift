//
//  SearchUseCase.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation
import RxSwift

protocol SearchUseCaseType {
    func getMockData() -> Observable<[String]>
}

struct SearchUseCase: SearchUseCaseType {
    
    func getMockData() -> Observable<[String]> {
        return APIRepository.shared.getListSearchData()
    }
}
