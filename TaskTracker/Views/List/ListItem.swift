//
//  ListItem.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListItem: View {
    var job: Job?
    var jobTitle: String
    var jobDeadline: Date

    init(job: Job? = nil) {
        self.job = job
        self.jobTitle = job?.title ?? "Missing Title"
        self.jobDeadline = job?.deadline ?? Date()
    }
    
    var body: some View {
        NavigationLink(destination: EditJobView(job: job)) {
            ZStack() {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .shadow(radius: 2)

                VStack(alignment: .leading) {
                    Text(jobDeadline.formatted(.dateTime
                        .month(.wide)
                        .day())
                    )
                    .font(.caption)
                    Text(jobTitle)
                        .font(.headline)
                }
                .foregroundColor(.black)
                .lineLimit(3)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    ListItem()
}
