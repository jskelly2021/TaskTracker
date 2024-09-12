//
//  EditJobView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 9/11/24.
//

import SwiftUI

struct EditJobView: View {
    @Environment(\.managedObjectContext)
    var context

    @FetchRequest(sortDescriptors: [])
    var jobs: FetchedResults<Job>

    var body: some View {
        Button(action: {
            let job = Job(context: context)
            job.title = "Test Job"
            try? context.save()
        }, label: {
            Text("Add job")
        })
    }
}

#Preview {
    EditJobView()
        .environment(\.managedObjectContext, DataController().container.viewContext)
}
