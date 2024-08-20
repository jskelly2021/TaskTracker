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
            Text(jobStore.jobs[0].name)
            Text(jobStore.jobs[1].name)
            Text(jobStore.jobs[2].name)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
        .environmentObject(JobStorage())
}
