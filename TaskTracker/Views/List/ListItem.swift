//
//  ListItem.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct task {
    let name: String
    let details: String
    let status: String
}

struct ListItem: View {
    
    let item: task
    
    var body: some View {

        HStack {
            Spacer()
            Text(item.name)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            Spacer()
            Text(item.status)
                .lineLimit(1)
            Spacer()
            Text("Details: \(item.details)")
                .lineLimit(2)
            Spacer()
        }
    }
}

#Preview {
    ListItem(item: TaskTracker.task(name: "Oil Change", details: "Full Synthetic Oil", status: "Monthly"))
}
