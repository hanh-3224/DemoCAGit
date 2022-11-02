//
//  AppAssembler.swift
//  DemoCA
//
//  Created by nguyen.huy.ha on 01/11/2022.
//

import UIKit

protocol Assembler: AnyObject,
                        AppAssembler,
                        SearchAssembler {
    
}

final class DefaultAssembler: Assembler {
    
}
