//
//  Repository.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 02/11/2022.
//

import Foundation
import RxSwift

protocol DataGateWayType {
    func getData() -> Observable<[String]>
}

struct DataGateWay: DataGateWayType {
    func getData() -> Observable<[String]> {
        return APIRepository.shared.getListSearchData()
    }
}
