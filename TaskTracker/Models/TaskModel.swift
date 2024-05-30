//
//  TaskModel.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import Foundation

struct Task {
    var name: String
    var status: String
    var details: String
    var deadline: Date
    var group: String
    var priority: Bool
}

class TaskModel : ObservableObject {
    let now: Date = Date.init()
    @Published var tasks: [Task] = []
 
    init() {
        loadTasks()
    }

    func loadTasks()
    {
        let task1 = Task(name: "Oil", status: "Monthly", details: "Full Synthetic", deadline: now, group: "Indoor", priority: false)
        let task2 = Task(name: "Vent", status: "Monthly", details: "20x25", deadline: now, group: "Indoor", priority: false)
        let task3 = Task(name: "Card Payment", status: "Monthly", details: "CapitalOne", deadline: now, group: "Finance", priority: true)

        tasks.append(task1)
        tasks.append(task2)
        tasks.append(task3)
    }

    func addTask(task: Task) {
        
    }

    func removeTask(task: Task) {

    }

}
