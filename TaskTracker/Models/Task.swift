//
//  Task.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/30/24.
//

import Foundation

struct Task : Codable, Identifiable {
    var id = UUID()
    var name: String
    var status: String
    var details: String
    var deadline: String
    var group: String
    var priority: Bool
}
