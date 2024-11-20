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
    var job: Job?
    @State var jobTitle: String
    @State var jobDetails: String
    @State var jobDeadline: Date

    init(job: Job? = nil, createNew: Bool = false) {
        self.createNew = createNew
        self.job = job
        self.jobTitle = job?.title ?? ""
        self.jobDetails = job?.details ?? ""
        self.jobDeadline = job?.deadline ?? Date()
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
                EditTask(jobTitle: $jobTitle, jobDetails: $jobDetails, jobDeadline: $jobDeadline)
            }
        }
        .padding()
        .onAppear {
            if createNew {
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
        let jobToSave = self.job ?? Job(context: context)

        jobToSave.title = jobTitle
        jobToSave.details = jobDetails
        jobToSave.deadline = jobDeadline

        if context.hasChanges {
            print("Context has Changes")
        }
    }
}

#Preview {
    let context = DataController(inMemory: true).container.viewContext
    let job = Job(context: context)
    job.title = "Sample Task"
    job.details = "A simple task for testing the preview."
    job.deadline = Date()

    return TaskHost(job: job)
        .environment(\.managedObjectContext, context)
}
