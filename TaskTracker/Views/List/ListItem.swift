//
//  ListItem.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListItem: View {
    
    let item: Job

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
    ListItem(item: Job(name: "Oil", status: "Monthly", details: "Full Synthetic", deadline: "", group: "Indoor", priority: false))
}
