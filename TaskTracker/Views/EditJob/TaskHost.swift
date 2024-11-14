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

    @State var job: Job?

    init(job: Job? = nil) {
        _job = State(initialValue: job)
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
            if job == nil {
                editMode?.wrappedValue = .active
            }
        }
    }

//    func saveChanges() {
//        let job = job ?? Job(context: context)
//
//        job.title = jobTitle
//        job.details = jobDetails
//        job.deadline = jobDeadline
//
//        try? context.save()
//        dismiss()
//    }
}

#Preview {
    TaskHost()
}
