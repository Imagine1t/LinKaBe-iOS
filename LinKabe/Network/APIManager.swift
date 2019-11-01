//
//  APIManager.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/20.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//

import Foundation
import PromiseKit
import SwiftyJSON

class APIManager {
    static let shared = APIManager()
    private var version: String = "1.2"
    private var domain: String = "https://cafenomad.tw/api/v"
    private var cities: [String] = ["taipei"]
    private let queue = DispatchQueue(label: "CoffeeShop")
    
    private init() {}
    
    func update() {
        for city in cities {
            let url = "\(domain)\(version)/cafes/\(city)"
            firstly {
                Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseData()
            }.done(on: queue) { result in
                if let json = try? JSON(data: result.data), let list = json.array {
                    
                }
            }.catch { (error) in
                print(error)
            }
        }
    }
}
