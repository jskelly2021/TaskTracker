//
//  TaskModel.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import Foundation

enum LoadError: Error {
    case BundleError
    case LoadingError
    case DecorderError
}

let jsonString = 
"""
    {
        "name" : "Oil Change",
        "status" : "Tri Monthly",
        "details" : "Full Synthetic",
        "deadline" : "TODO",
        "group" : "Automotive",
        "priority" : false
    }
"""

class JobStorage : ObservableObject {
    @Published var jobs: [Job] = []

    private static func getFileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathExtension("tasks.JSON")
    }

    func loadJobs() throws {
        let fileURL = try Self.getFileURL()

        guard let data = try? Data(contentsOf: fileURL)
        else {
            jobs = []
            return
        }

        self.jobs = try JSONDecoder().decode([Job].self, from: data)
    }
    
    func saveJobs(jobs: [Job] ) throws {
        let data = JSONEncoder().encode(jobs)
        let fileURL = try Self.getFileURL()
        
        try data.write(to: fileURL)
    }
}
