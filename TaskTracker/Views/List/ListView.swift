//
//  ListView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListView: View {

    @Binding var date: Date
    @State var tasks: [task] = [
        TaskTracker.task(name: "Oil Change", details: "Full Synthetic Oil", status: "Bi-Monthly"),
        TaskTracker.task(name: "Hallway Air Filter", details: "25in x 20in", status: "Monthly"),
        TaskTracker.task(name: "Credit Card Payment", details: "Capital One Card", status: "Monthly")
    ]
    
    var body: some View {

        List {
            Section(header: Text(date.formatted(date: .long, time: .omitted))) {
                ForEach(tasks.indices, id: \.self) { index in
                    ListItem(item: tasks[index])
                }
            }
        }
        .listStyle(.plain)
    }
}
