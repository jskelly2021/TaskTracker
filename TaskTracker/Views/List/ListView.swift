//
//  ListView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var jobStore: JobStorage

    let testItem: Job = Job(name: "Oil Change", status: "Monthly", details: "Full Synthetic", deadline: Date(), group: "Indoor", priority: false)
    
    var body: some View {
        List {
            ListItem(item: testItem)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
        .environmentObject(JobStorage())
}
