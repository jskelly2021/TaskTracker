//
//  DataController.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 9/8/24.
//

import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "JobDatabase")

    init() {
        container.loadPersistentStores {description, error in
            if let error = error {
                print("Error loading Core Data: \(error.localizedDescription)")
            }
            
        }
    }
}
