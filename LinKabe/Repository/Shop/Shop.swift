//
//  Shop.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/20.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//

import Foundation
import ObjectMapper

class Shop: Mappable {
    var id: String = ""
    var name: String = ""
    var long: Double = 0
    var lat: Double = 0
    var address: String = ""
    var city: String = ""
    var limitedTime: Bool?
    var openTime: String?
    var tasty: Double?
    var cheap: Double?
    var seat: Double?
    var mrt: String?
    var quiet: Double?
    var music: Double?
    var socket: String?
    var wifi: Double?
    var standingDesk: String?
    var url: URL?
    
    required init?(map: Map) {
        
    } 
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        long <- map["longitude"]
        lat <- map["latitude"]
        address <- map["address"]
        city <- map["city"]
        limitedTime <- map["limited_time"]
        openTime <- map["open_time"]
        tasty <- map["tasty"]
        cheap <- map["cheap"]
        seat <- map["seat"]
        mrt <- map["mrt"]
        quiet <- map["quiet"]
        music <- map["music"]
        socket <- map["socket"]
        wifi <- map["wifi"]
        standingDesk <- map["standing_desk"]
        url <- map["url"]
    }
    
}
