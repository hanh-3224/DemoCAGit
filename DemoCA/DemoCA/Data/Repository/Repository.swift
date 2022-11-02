//
//  Repository.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 02/11/2022.
//

import Foundation
import RxSwift

protocol RepositoryType {
    func getData() -> Observable<[String]>
}

struct Repository: RepositoryType {
    let mockData = ["Lop 1 ", "Lop 2", "Lop 3 ", "Lop 4","Lop 5 ", "Lop 6", "Lop 7 ", "Lop 8", "Lop 9 ", "Lop 10", "Lop 11 ", "Lop 12"]
    func getData() -> Observable<[String]> {
        return Observable.of(mockData)
    }
}
