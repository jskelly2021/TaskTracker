//
//  TaskViewHost.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/14/24.
//

import SwiftUI

struct TaskHost: View {
    @Environment(\.editMode) var editMode
    @Environment(\.dismiss) var dismiss

    var job: Job?
    
    init(job: Job? = nil) {
        self.job = job
    }

    var body: some View {
        VStack {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
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
    }
}

#Preview {
    TaskHost()
}
