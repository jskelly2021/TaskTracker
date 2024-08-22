//
//  TaskTrackerApp.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/14/24.
//

import SwiftUI

@main
struct TaskTrackerApp: App {
    @StateObject private var jobStore: JobStorage = JobStorage()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
            .environmentObject(jobStore)
    }
}
