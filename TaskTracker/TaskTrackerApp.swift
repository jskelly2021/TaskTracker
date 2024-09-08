//
//  TaskTrackerApp.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/14/24.
//

import SwiftUI

@main
struct TaskTrackerApp: App {
    @StateObject var dataController: DataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
