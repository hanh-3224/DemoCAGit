//
//  GithubUser.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import Foundation

struct GihubUser: Decodable {
    var login: String
    var avatar_url: String
}

struct SearchReponse: Decodable {
    var items: [GihubUser]
}
