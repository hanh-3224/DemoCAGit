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

struct SearchUseCase: SearchUseCaseType, SearchData {
    var dataGateWaytype: DataGateWayType
    
    func getMockData() -> Observable<[String]> {
        return getData()
    }
}
