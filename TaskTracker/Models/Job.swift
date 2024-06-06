//
//  Task.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/30/24.
//

import Foundation

struct Job : Codable {
    var name: String
    var status: String
    var details: String
    var deadline: String
    var group: String
    var priority: Bool
}
