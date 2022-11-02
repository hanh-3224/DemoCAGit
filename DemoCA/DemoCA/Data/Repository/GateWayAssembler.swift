//
//  GateWayAssembler.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 02/11/2022.
//

import Foundation

protocol GatewayAssembler {
    func resolve() -> RepositoryType
}

extension GatewayAssembler where Self : DefaultAssembler {
    func resolve() -> RepositoryType {
        return Repository()
    }
}
