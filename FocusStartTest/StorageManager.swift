//
//  StorageManager.swift
//  FocusStartTest
//
//  Created by Apple on 17/09/2019.
//  Copyright © 2019 Alexey Berezov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ car: Car) {
        try! realm.write {
            realm.add(car)
        }
    }
    
    static func deleteObject(_ car: Car) {
        try! realm.write {
            realm.delete(car)
        }
    }
    
}
