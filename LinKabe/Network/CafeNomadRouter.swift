//
//  CafeNomadRouter.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/22.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//

import Moya

enum CafeNomad {
    case info(city: String)
}

extension CafeNomad: TargetType {
    var headers: [String : String]? {
        return ["Content-type" : "application/json"]
    }
    
    var baseURL: URL {
        return URL(string: "https://cafenomad.tw/")!
    }
    
    var path: String {
        switch self {
        case .info(let city):
            return "api/v1.2/" + city
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .info(_):
            return nil
        }
    }
    
    var method: Method {
        switch self {
        case .info(_):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .info(_):
            return .requestPlain
        }
    }
    
    var sampleData: Data {
        switch self {
        case .info(_):
            return Data()
        }
    }
}
