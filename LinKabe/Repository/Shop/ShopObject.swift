//
//  ShopObject.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/20.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//
import RealmSwift
import SwiftyJSON

class ShopObject: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var long: Double = 0
    @objc dynamic var lat: Double = 0
    @objc dynamic var address: String = ""
    @objc dynamic var city: String = ""
    dynamic var limitedTime: Bool?
    dynamic var openTime: String?
    dynamic var tasty: Double?
    dynamic var cheap: Double?
    dynamic var seat: Double?
    dynamic var mrt: String?
    dynamic var quiet: Double?
    dynamic var music: Double?
    dynamic var socket: String?
    dynamic var wifi: Double?
    dynamic var standingDesk: String?
    dynamic var url: String?
    /* v1.2 api format
     {
       "longitude" : "121.51528650",
       "limited_time" : "no",
       "tasty" : 5,
       "cheap" : 4,
       "address" : "新北市永和區永貞路214號",
       "seat" : 4.5,
       "mrt" : "永安市場站",
       "quiet" : 3,
       "latitude" : "25.00409680",
       "music" : 4,
       "socket" : "no",
       "city" : "taipei",
       "wifi" : 0,
       "open_time" : "雙週四公休，有變更另外公告",
       "id" : "000703fe-cf8a-43c8-bd83-c90cfd61915f",
       "name" : "蜂巢咖啡",
       "standing_desk" : "yes",
       "url" : "https:\/\/www.facebook.com\/honeycombcafe2016\/"
     }
     */
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension Object {
    func toDictionary() -> [String: Any] {
        print(self.objectSchema.properties.map { $0.name })
        return [:]
    }
}
