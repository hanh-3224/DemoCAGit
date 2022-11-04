//
//  GetListData.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 02/11/2022.
//

import UIKit
import RxSwift

protocol SearchData {
    var dataGateWaytype: DataGateWayType { get }
}

extension SearchData {
    func getData() -> Observable<[String]> {
        return dataGateWaytype.getData()
    }
}
