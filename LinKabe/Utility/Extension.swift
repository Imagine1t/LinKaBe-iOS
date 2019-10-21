//
//  Extension.swift
//  LinKabe
//
//  Created by Crimson Yang on 2019/10/20.
//  Copyright © 2019 Crimson Yang. All rights reserved.
//

import Foundation

extension URL {
    static func databasePath(with id: String) -> URL {
        var forDomain: FileManager.SearchPathDirectory
        #if DEBUG
        forDomain = .documentDirectory
        #else
        forDomain = .libraryDirectory
        #endif
        let path = try! FileManager.default.url(for: forDomain, in: .userDomainMask, appropriateFor: nil, create: false)
        return path.appendingPathComponent("\(id).realm")
    }
}
