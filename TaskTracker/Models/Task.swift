//
//  Task.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/30/24.
//

import Foundation

struct Task : Codable {
    var name: String
    var status: String
    var details: String
    var deadline: Date
    var group: String
    var priority: Bool
}
