//
//  ListView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListView: View {
    @Environment(\.managedObjectContext) var context

    @FetchRequest(sortDescriptors: []) var jobs: FetchedResults<Job>

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: EditJobView()) {
                    Text("Create New")
                }

                List {
                    ForEach(jobs, id: \.self) { job in
                        NavigationLink(destination: EditJobView(job: job)) {
                            Text(job.title ?? "na")
                        }
                    }
                    .onDelete(perform: {offsets in
                        context.delete(jobs[offsets.first ?? 0])
                        try? context.save()
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    ListView()
        .environment(\.managedObjectContext, DataController().container.viewContext)
}
