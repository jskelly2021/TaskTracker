//
//  ListItem.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListItem: View {
    var job: Job
    var jobTitle: String
    var jobDeadline: Date

    init(job: Job) {
        self.job = job
        self.jobTitle = job.title ?? ""
        self.jobDeadline = job.deadline ?? Date()
    }
    
    var body: some View {
        NavigationLink(destination: TaskHost(job: job)) {
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
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .lineLimit(2)
                .padding()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    let context = DataController().container.viewContext
    let job = Job(context: context)
    job.title = "Sample Task"
    job.details = "A simple task for testing the preview."
    job.deadline = Date()

    return ListItem(job: job)
        .environment(\.managedObjectContext, context)
}
