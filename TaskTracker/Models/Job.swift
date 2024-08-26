//
//  Task.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/30/24.
//

import Foundation

struct Job : Codable {
    var name: String
    var status: Bool // false - incomplete : true - complete
    var details: String
    var deadline: Date
}

func JobDateFormat() -> DateFormatter {
    let jobDateFormat = DateFormatter()
    
    jobDateFormat.dateFormat = "dd.MM.yyyy"

    return jobDateFormat
}
