//
//  ListView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var jobStore: JobStorage

    var body: some View {

        List {
            ForEach(jobStore.jobs, id: \.name) { Job in
                ListItem(item: Job)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
        .environmentObject(JobStorage())
}
