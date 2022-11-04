//
//  APIService.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 04/11/2022.
//

import Foundation
import RxSwift

struct APIRepository {
    static let shared = APIRepository()
    
    private init() {}
    
    func getListSearchData() -> Observable<[String]> {
        let mockData = ["Lop 1 ", "Lop 2", "Lop 3 ", "Lop 4","Lop 5 ", "Lop 6", "Lop 7 ", "Lop 8", "Lop 9 ", "Lop 10", "Lop 11 ", "Lop 12"]
        return Observable.of(mockData)
    }
}
