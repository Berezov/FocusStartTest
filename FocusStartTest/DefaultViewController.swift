//
//  ContentViewController.swift
//  FocusStartTest
//
//  Created by Apple on 17/09/2019.
//  Copyright © 2019 Alexey Berezov. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {
    
    func saveDefaultCar() {
        
        let defaultCarOne = Car(year: "2000",
                         manufacturer: "Honda",
                         carModel: "Inegra",
                         bodyType: "Cupe")
        StorageManager.saveObject(defaultCarOne)
        
        let defaultCarTwo = Car(year: "2010",
                                manufacturer: "Kia",
                                carModel: "Rio",
                                bodyType: "Sedan")
        StorageManager.saveObject(defaultCarTwo)
        
        let defaultCarThree = Car(year: "1995",
                                manufacturer: "Mersedes",
                                carModel: "S200",
                                bodyType: "Sedan")
        StorageManager.saveObject(defaultCarThree)
    
    }
}
