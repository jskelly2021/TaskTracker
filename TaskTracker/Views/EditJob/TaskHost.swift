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

    var body: some View {
        VStack {
            HStack {
                Spacer()
                EditButton()
            }
            
            Spacer()
            
            if editMode?.wrappedValue == .inactive {
                TaskSummary()
            }
            else {
                EditJobView()
            }
        }
        .padding()
    }
}

#Preview {
    TaskHost()
}
