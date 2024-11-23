//
//  TaskViewHost.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/14/24.
//

import SwiftUI

struct TaskHost: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.editMode) var editMode
    @Environment(\.dismiss) var dismiss

    var createNew: Bool
    @ObservedObject var job: Job

    init(job: Job, createNew: Bool = false) {
        self.createNew = createNew
        self.job = job
    }

    var body: some View {
        VStack {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        context.rollback()
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                TaskSummary(job: job)
            }
            else {
                EditTask(job: job)
            }
        }
        .padding()
        .onAppear {
            if createNew {
                if job.managedObjectContext == nil {
                    context.insert(job)
                }
                editMode?.wrappedValue = .active
            }
        }
        .onChange(of: editMode?.wrappedValue) {
            if editMode?.wrappedValue == .inactive {
                saveChanges()
            }
        }

    }

    func saveChanges() {
        if context.hasChanges {
            try? context.save()
        }
    }
}

#Preview {
    let context = DataController(inMemory: true).container.viewContext
    let job = Job(context: context)
    job.title = "Sample Task"
    job.details = "A simple task for testing the preview."
    job.timeScale = 0
    job.deadline = Date()

    return TaskHost(job: job)
        .environment(\.managedObjectContext, context)
}
