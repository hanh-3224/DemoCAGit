//
//  GetListData.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 02/11/2022.
//

import UIKit
import RxSwift

protocol GetListsSearchData {
    var repository: RepositoryType { get }
}

extension GetListsSearchData {
    func getData() -> Observable<[String]> {
        return repository.getData()
    }
}
