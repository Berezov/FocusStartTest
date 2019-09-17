//
//  CarModel.swift
//  FocusStartTest
//
//  Created by Apple on 16/09/2019.
//  Copyright © 2019 Alexey Berezov. All rights reserved.
//

import RealmSwift

class Car:Object {
    
    @objc dynamic var year: String?
    @objc dynamic var manufacturer: String?
    @objc dynamic var carModel: String?
    @objc dynamic var bodyType: String?
    
    convenience init(year: String?, manufacturer: String?, carModel: String?, bodyType: String?) {
        self.init()
        self.year = year
        self.manufacturer = manufacturer
        self.carModel = carModel
        self.bodyType = bodyType
    }
}
