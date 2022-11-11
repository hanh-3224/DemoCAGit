//
//  GithubUser.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation

struct GithubUser: Decodable {
    var login: String
    var avatar_url: String
}

struct SearchReponse: Decodable {
    var items: [GithubUser]
}

class DataTableView: NSObject {
    @objc dynamic var data = [String]()
}
