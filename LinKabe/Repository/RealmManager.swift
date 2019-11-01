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
    var schemaVersion: UInt64 = 1
    
    private init() {
        let path = URL.databasePath()
        print(path)
//        let config = Realm.Configuration(fileURL: path, inMemoryIdentifier: nil, syncConfiguration: nil, encryptionKey: nil, readOnly: false, schemaVersion: schemaVersion, migrationBlock: { (migration, oldVersion) in
//            print(oldVersion)
//        }, deleteRealmIfMigrationNeeded: false, shouldCompactOnLaunch: nil, objectTypes: [ShopObject.self])
        let currentVersion = schemaVersion
        var config = Realm.Configuration()
        config.deleteRealmIfMigrationNeeded = true
        config.schemaVersion = currentVersion
        config.fileURL = path
        config.objectTypes = [ShopObject.self]
        config.migrationBlock = { migration, oldVersion in
            if oldVersion < currentVersion {
                print("migration")
            }
        }
        Realm.Configuration.defaultConfiguration = config
        realm = try! Realm()
        shopRepository = ShopRepository(realm)
    }
}
