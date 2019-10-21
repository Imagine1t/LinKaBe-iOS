//
//  RealmRepository.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/20.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//

import RealmSwift

class RealmRepository<IdType: Hashable, EntityType, RealmType: Object>: Repository {
    
    let realm: Realm
    
    init(_ realm: Realm) {
        self.realm = realm
    }
    
    func identify(_ entity: EntityType) -> IdType {
        fatalError("should override this")
    }
    
    func get(id: IdType) -> EntityType? {
        if let object = realm.object(ofType: RealmType.self, forPrimaryKey: id) {
            return fromRealmObject(object)
        }
        return nil
    }
    
    func getAll() -> [EntityType] {
        let objects = realm.objects(RealmType.self)
        var result = [EntityType]()
        for object in objects {
            result.append(fromRealmObject(object))
        }
        return result
    }
    
    func save(_ entity: EntityType) {
        realm.beginWrite()
        do {
            realm.add(toRealmObject(entity))
            try realm.commitWrite()
        } catch {
            if realm.isInWriteTransaction {
                realm.cancelWrite()
            }
            print("failed to save", error)
        }
    }
    
    func update(_ entity: EntityType) {
        realm.beginWrite()
        do {
            realm.add(toRealmObject(entity))
            try realm.commitWrite()
        } catch {
            if realm.isInWriteTransaction {
                realm.cancelWrite()
            }
            print("failed to update", error)
        }
    }
    
    func hasSaved(id: IdType) -> Bool {
        return get(id: id) != nil
    }
    
    func hasSaved(_ entity: EntityType) -> Bool {
        return get(id: identify(entity)) != nil
    }
    
    func saveOrUpdate(_ entity: EntityType) {
        if !hasSaved(entity) {
            save(entity)
        } else {
            update(entity)
        }
    }
    
    func remove(id: IdType) {
        if let object = realm.object(ofType: RealmType.self, forPrimaryKey: id) {
            do {
                try realm.write {
                    self.realm.delete(object)
                }
            } catch {
                print("failed to remove object,", error)
            }
        }
    }
    
    func removeAll() {
        do {
            try realm.write {
                self.realm.delete(self.realm.objects(RealmType.self))
            }
        } catch {
            print("failed to remove all,", error)
        }
    }
    
    func toRealmObject(_ entity: EntityType) -> RealmType {
        fatalError("should override this")
    }
    
    func fromRealmObject(_ object: RealmType) -> EntityType {
        fatalError("should override this")
    }
}
