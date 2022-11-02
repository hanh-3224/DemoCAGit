//
//  SearchUseCase.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation
import RxSwift

protocol SearchUseCaseType {
    func getDataTableView() -> Observable<[String]>
}

struct SearchUseCase: SearchUseCaseType, GetListsSearchData {
    var repository: RepositoryType
    
    func getDataTableView() -> Observable<[String]> {
        return getData()
    }
}
