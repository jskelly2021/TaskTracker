//
//  ListView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListView: View {

//    @Binding var date: Date
     var date: Date = Date()

    @EnvironmentObject var jobStore: JobStorage

    var body: some View {

        List {
            Section(header: Text(date.formatted(date: .long, time: .omitted))) {

                ForEach(jobStore.jobs.indices, id: \.self) { index in
                        ListItem(item: jobStore.jobs[index])
                }
            }
        }
        .listStyle(.plain)

    }
}

#Preview {
    ListView()
        .environmentObject(JobStorage())
}
