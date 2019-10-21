//
//  RealmManager.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/20.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//

import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    private var shopRepository: ShopRepository
    private var realm: Realm
    var schemaVersion: UInt64 = 12
    var uuid: String = ""
    
    private init() {
        uuid = UUID().uuidString
        let path = URL.databasePath(with: uuid)
        let config = Realm.Configuration(fileURL: path, inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: false, schemaVersion: schemaVersion, migrationBlock: { (migration, oldVersion) in
            
        }, deleteRealmIfMigrationNeeded: false, shouldCompactOnLaunch: nil, objectTypes: [ShopObject.self])
        Realm.Configuration.defaultConfiguration = config
        realm = try! Realm()
        shopRepository = ShopRepository(realm)
    }
}
