//
//  MainTableViewController.swift
//  FocusStartTest
//
//  Created by Apple on 16/09/2019.
//  Copyright © 2019 Alexey Berezov. All rights reserved.
//

import UIKit
import RealmSwift

class CarDirectoryController: UITableViewController {
    
    var cars: Results<Car>!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cars = realm.objects(Car.self)
        
        let userDefault = UserDefaults.standard
        let firstStart = userDefault.bool(forKey: "firstStart")

        guard !firstStart else { return }

        if let contentViewController = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? DefaultViewController {
            present(contentViewController, animated: true, completion: nil)
        }
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.isEmpty ? 0 : cars.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CarDirectoryCell
        
        let car = cars[indexPath.row]
        
        cell.yearLabel.text = car.year
        cell.manufacturerLabel.text = car.manufacturer
        cell.modelLabel.text = car.carModel
        cell.bodyTypeLabel.text = car.bodyType
        

        return cell
    }
    
    // Mark: Table View Delegate
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let car = cars[indexPath.row]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            
            StorageManager.deleteObject(car)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [deleteAction]
    }
    
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "EditSegue" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let car = cars[indexPath.row]
            let newCarVC = segue.destination as! NewCarController
            newCarVC.currentCar = car
        }
        
    }
 
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {
        
        guard let newCarVC = segue.source as? NewCarController else { return }
        
        newCarVC.saveCar()
        tableView.reloadData()
        
    }
    
    @IBAction func unwindDefaultSegue(_ segue: UIStoryboardSegue) {
        
        guard let defaultCarVC = segue.source as? DefaultViewController else { return }
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "firstStart")
        userDefaults.synchronize()
        
        defaultCarVC.saveDefaultCar()
        tableView.reloadData()
        
    }

}
