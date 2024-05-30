//
//  TaskModel.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import Foundation

class TaskModel : ObservableObject {
    let now: Date = Date.init()
    
    let date1 = Calendar.current.date(
            from: DateComponents(
            calendar: Calendar.current,
            year: 2024,
            month: 5,
            day: 31)
        ) ?? Date()
    
    let date2 = Calendar.current.date(
            from: DateComponents(
            calendar: Calendar.current,
            year: 2024,
            month: 5,
            day: 28)
        ) ?? Date()
    
    @Published var tasks: [Task] = []
 
    init() {
        loadTasks()
    }

    func loadTasks()
    {
        let task1 = Task(name: "Oil", status: "Monthly", details: "Full Synthetic", deadline: date1, group: "Indoor", priority: false)
        let task2 = Task(name: "Upstairs Air Vent", status: "Monthly", details: "20x25", deadline: now, group: "Indoor", priority: false)
        let task3 = Task(name: "Downstairs Air Vent", status: "Monthly", details: "20x25", deadline: now, group: "Indoor", priority: false)
        let task4 = Task(name: "Card Payment", status: "Monthly", details: "CapitalOne", deadline: date2, group: "Finance", priority: true)

        tasks.append(task1)
        tasks.append(task2)
        tasks.append(task3)
        tasks.append(task4)
    }

    func addTask(task: Task) {
        
    }

    func removeTask(task: Task) {

    }

}
