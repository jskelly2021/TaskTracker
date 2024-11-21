//
//  TaskSummaryView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/14/24.
//

import SwiftUI

struct TaskSummary: View {
    var job: Job
    var jobTitle: String
    var jobDetails: String
    var jobDeadline: Date
    var jobTimeScale: TimeScales

    init(job: Job) {
        self.job = job
        jobTitle = job.title ?? ""
        jobDetails = job.details ?? ""
        jobDeadline = job.deadline ?? Date()
        jobTimeScale = TimeScales(rawValue: job.repetition) ?? .single
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(jobTitle)
                    .lineLimit(3)
                    .font(.largeTitle)
                    .bold()

                Text(jobDetails)
                    .lineLimit(5)
                    .font(.headline)

                Divider()

                HStack {
                    VStack(alignment: .leading) {
                        Text("Next Deadline")
                            .font(.headline)
                        Text(jobDeadline.formatted(date: .abbreviated, time: .shortened))
                    }

                    Spacer()

                    VStack(alignment: .leading) {
                        Text("Repeats:")
                            .font(.headline)
                        Text("\(jobTimeScale.toString())")
                    }
                }

                Spacer()
            }
            Spacer()
        }
    }

}

#Preview {
    let context = DataController(inMemory: true).container.viewContext
    let job = Job(context: context)
    job.title = "Sample Task"
    job.details = "A simple task for testing the preview."
    job.deadline = Date()

    return TaskSummary(job: job)
        .environment(\.managedObjectContext, context)
}
