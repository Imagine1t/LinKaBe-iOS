//
//  Repository.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/20.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//

protocol Repository {
    associatedtype IdType: Hashable
    associatedtype EntityType: Any
    
    func save(_ entity: EntityType)
    func identify(_ entity: EntityType) -> IdType
    func get(id: IdType) -> EntityType?
    func getAll() -> [EntityType]
    func update(_ entity: EntityType)
    func saveOrUpdate(_ entity: EntityType)
    func remove(id: IdType)
    func removeAll()
    func hasSaved(id: IdType) -> Bool
    func hasSaved(_ entity: EntityType) -> Bool
}
