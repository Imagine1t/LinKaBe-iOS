//
//  ShopRepository.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/20.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//

class ShopRepository: RealmRepository<String, Shop, ShopObject> {
    
    override func identify(_ entity: Shop) -> String {
        return entity.id
    }
    
    override func toRealmObject(_ entity: Shop) -> ShopObject {
        let object = ShopObject()
        object.id = entity.id
        object.name = entity.name
        object.long = entity.long
        object.lat = entity.lat
        object.address = entity.address
        object.city = entity.city
        object.limitedTime = entity.limitedTime
        object.openTime = entity.openTime
        object.tasty = entity.tasty
        object.cheap = entity.cheap
        object.seat = entity.seat
        object.mrt = entity.mrt
        object.quiet = entity.quiet
        object.music = entity.music
        object.socket = entity.socket
        object.wifi = entity.wifi
        object.standingDesk = entity.standingDesk
        object.url = entity.url?.absoluteString
        return object
    }
    
    override func fromRealmObject(_ object: ShopObject) -> Shop {
        return Shop(JSON: object.toDictionary())!
    }
}
