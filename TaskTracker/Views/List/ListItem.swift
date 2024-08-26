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
                .lineLimit(2)
            Spacer()
            if item.status {
                Text("Complete")
                    .lineLimit(1)
            }
            else {
                Text("Incomplete")
                    .lineLimit(1)
            }
            Spacer()
            Text("Details: \(item.details)")
                .lineLimit(2)
            Spacer()
        }
    }
}

#Preview {
    ListItem(item: Job(name: "Oil", status: false, details: "Full Synthetic", deadline: Date()))
}
