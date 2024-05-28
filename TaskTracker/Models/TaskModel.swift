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

class TaskModel {
    let now: Date = Date.init()
    var tasks: [Task] = []
 
    init() {
        loadTasks()
    }

    func loadTasks()
    {
        var task1 = Task(name: "Oil", status: "Monthly", details: "Full Synthetic", deadline: now, group: "Indoor", priority: false)
        tasks.append(task1)
    }
    
    func removeTask(task: Task) {

    }
}
