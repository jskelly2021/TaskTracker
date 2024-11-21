//
//  ListView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Job.deadline, ascending: true)])
    var jobs: FetchedResults<Job>

    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack {
                    if jobs.isEmpty {
                        Text("No Tasks Available")
                            .foregroundColor(.gray)
                            .padding()
                    }
                    else {
                        jobGrid()
                            .padding()
                        }
                }
            }
            .navigationDestination(for: Destinations.self) { destination in
                switch destination {
                case .ViewTask(let job):
                    TaskHost(job: job)
                case .CreateTask(let job):
                    TaskHost(job: job, createNew: true)
                }
            }
            .navigationTitle("Your Tasks")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    createNewButton()
                }
            }
        }
    }

    private func jobGrid() -> some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            ForEach(jobs, id: \.self) { job in
                ListItem(job: job)
            }
        }
    }

    private func createNewButton() -> some View {
        Button {
            let newTask = Job(context: context)
            newTask.title = ""
            newTask.details = ""
            newTask.deadline = Date()
            newTask.timeScale = TimeScales.single.rawValue

            path.append(Destinations.CreateTask(newTask))
        }
        label: {
            Image(systemName: "plus.circle")
        }
    }
}

#Preview {
    return ListView()
        .environment(\.managedObjectContext, DataController(inMemory: true).container.viewContext)
}
