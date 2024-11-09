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

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        NavigationLink(destination: EditJobView()) {
                            Text("Create New")
                        }
                    }

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(jobs, id: \.self) { job in
                            ListItem(job: job)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ListView()
        .environment(\.managedObjectContext, DataController().container.viewContext)
}
