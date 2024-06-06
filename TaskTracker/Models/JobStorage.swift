//
//  TaskModel.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import Foundation

class JobStorage : ObservableObject {
    @Published var jobs: [Job] = []
    
    init() {
        do {
            try loadJobs(filename: "jobs.data")
            print(jobs[0].deadline)
        }
        catch {
            print("Error loading Jobs \(error)")
        }
    }

    func loadJobs(filename: String) throws {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            print("Couldn't find \(filename) in main bundle.")
            return
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            print("Couldn't load \(filename) from main bundle:\n\(error)")
            return
        }

        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(JobDateFormat())

            jobs = try decoder.decode([Job].self, from: data)
        } catch {
            print("Couldn't parse \(filename) as \(Job.self):\n\(error)")
        }
    }

    func saveJobs(jobs: [Job] ) throws {

    }
}
