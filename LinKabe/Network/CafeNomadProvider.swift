//
//  CafeNomadProvider.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/22.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//

import Moya

class CafeNomadProvider {
    static let shared = CafeNomadProvider()
    var provider: MoyaProvider<CafeNomad>
    let endpointClosure: MoyaProvider<CafeNomad>.EndpointClosure
    let requestClosure: MoyaProvider<CafeNomad>.RequestClosure
    let stubClosure: MoyaProvider<CafeNomad>.StubClosure
    
    private init() {
        endpointClosure = { target -> Endpoint in
            
        }
        requestClosure = { (target, result) -> Void in
            
        }
        stubClosure = { (target) -> Moya.StubBehavior in
            
        }
        provider = MoyaProvider<CafeNomad>(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, callbackQueue: .global(), manager: .default, plugins: <#T##[PluginType]#>, trackInflights: <#T##Bool#>)
    }
}
