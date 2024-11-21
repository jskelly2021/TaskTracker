//
//  DataController.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 9/8/24.
//

import CoreData

class DataController: ObservableObject {
    static let instance = DataController()
    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "JobDatabase")

        if inMemory {
            let description = NSPersistentStoreDescription()
            description.url = URL(fileURLWithPath: "/dev/null")
            container.persistentStoreDescriptions = [description]
        }

        container.loadPersistentStores {description, error in
            if let error = error {
                print("Error loading Core Data: \(error.localizedDescription)")
            }
        }

        // DELETING TASKS
//        deleteAllTasks(from: container.viewContext)
    }

    func deleteAllTasks(from context: NSManagedObjectContext) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Job.fetchRequest()

        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(deleteRequest)
            try context.save()
            print("All tasks deleted successfully.")
        }
        catch {
            print("Failed to delete tasks: \(error.localizedDescription)")
        }
    }

}
