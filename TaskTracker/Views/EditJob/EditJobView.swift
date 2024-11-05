//
//  EditJobView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 9/11/24.
//

import SwiftUI

struct EditJobView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss

    @FetchRequest(sortDescriptors: [])
    var jobs: FetchedResults<Job>

    var job: Job?
    @State var jobTitle: String
    @State var jobDetails: String
    @State var jobDeadline: Date

    init(job: Job? = nil) {
        self.job = job
        jobTitle = job?.title ?? ""
        jobDetails = job?.details ?? ""
        jobDeadline = job?.deadline ?? Date()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            HStack(spacing: 10.0) {
                Spacer()
                doneButton()
            }

            TextField("Title", text: $jobTitle, axis: .vertical)
                .lineLimit(3)
                .font(.largeTitle)
                .bold()

            TextField("Details", text: $jobDetails, axis: .vertical)
                .lineLimit(5)
                .font(.headline)

            Spacer()

            Text("Deadline")
                .font(.headline)
            DatePicker("Deadline", selection: $jobDeadline, displayedComponents: .date)
                .datePickerStyle(.graphical)
                .id(jobDeadline)
            Spacer()
        }
        .padding()
    }

    func doneButton() -> some View {
        return Button(action: saveJob, label: {
            Text("Done")
        })
    }

    func saveJob() {
        let job = job ?? Job(context: context)

        job.title = jobTitle
        job.details = jobDetails
        job.deadline = jobDeadline

        try? context.save()
        dismiss()
    }

}

#Preview {
    EditJobView()
        .environment(\.managedObjectContext, DataController().container.viewContext)
}
