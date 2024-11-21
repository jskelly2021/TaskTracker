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
                    HStack {
                        createNewButton()
                    }
                    jobGrid()
                        .padding()
                }
            }
            .navigationDestination(for: Destinations.self) { destination in
                switch destination {
                case .ViewTask(let job):
                    TaskHost(job: job)
                case .CreateTask:
                    TaskHost(job: newTask(), createNew: true)
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
            path.append(Destinations.CreateTask)
        } label: {
            Text("Create New")
        }
    }

    private func newTask() -> Job {
        let newTask = Job(context: context)
        newTask.title = ""
        newTask.details = ""
        newTask.deadline = Date()
        return newTask
    }
}

#Preview {
    return ListView()
        .environment(\.managedObjectContext, DataController(inMemory: true).container.viewContext)
}
