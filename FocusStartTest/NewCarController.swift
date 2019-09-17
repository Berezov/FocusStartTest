//
//  NewCarController.swift
//  FocusStartTest
//
//  Created by Apple on 17/09/2019.
//  Copyright © 2019 Alexey Berezov. All rights reserved.
//

import UIKit

class NewCarController: UITableViewController {
    
    var currentCar: Car?
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    @IBOutlet var carYear: UITextField!
    @IBOutlet var carManufacturer: UITextField!
    @IBOutlet var carModel: UITextField!
    @IBOutlet var carBodyType: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        setupEditScreen()
        
    }
    
    func saveCar() {
        
        let newCar = Car(year: carYear.text,
                         manufacturer: carManufacturer.text,
                         carModel: carModel.text,
                         bodyType: carBodyType.text)
        
        if currentCar != nil {
            try! realm.write {
                currentCar?.year = newCar.year
                currentCar?.manufacturer = newCar.manufacturer
                currentCar?.carModel = newCar.carModel
                currentCar?.bodyType = newCar.bodyType
            }
        } else {
            
         StorageManager.saveObject(newCar)
            
        }
    }
    
    private func setupEditScreen() {
        if currentCar != nil {
            
            navigationItem.leftBarButtonItem = nil
            title = "Изменить автомобиль"
            
            carYear.text = currentCar?.year
            carManufacturer.text = currentCar?.manufacturer
            carModel.text = currentCar?.carModel
            carBodyType.text = currentCar?.bodyType
        }
    }

    @IBAction func cancelAction(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
}

// MARK: Text field delegate

extension NewCarController: UITextFieldDelegate {
    
    // Скрываем клавиатуру по нажатию на Done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
