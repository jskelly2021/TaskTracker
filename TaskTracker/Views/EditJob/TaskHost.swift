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

    var job: Job?
    var createNew: Bool

    init(job: Job? = nil, createNew: Bool = false) {
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
//                EditTask(job: $job)
            }
        }
        .padding()
        .onAppear {
            if createNew {
                editMode?.wrappedValue = .active
            }
        }
    }

    func saveChanges() {
        try? context.save()
        dismiss()
    }
}

#Preview {
    let context = DataController().container.viewContext
    let job = Job(context: context)
    job.title = "Sample Task"
    job.details = "A simple task for testing the preview."
    job.deadline = Date()

    return TaskHost(job: job)
        .environment(\.managedObjectContext, context)
}
