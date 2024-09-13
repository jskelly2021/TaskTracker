//
//  EditJobView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 9/11/24.
//

import SwiftUI

struct EditJobView: View {
    @Environment(\.managedObjectContext)
    var context

    @FetchRequest(sortDescriptors: [])
    var jobs: FetchedResults<Job>

    @State var jobTitle: String = ""
    @State var jobDetails: String = ""
    @State var jobDeadline: Date = Date()

    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            HStack(spacing: 10.0) {
                Spacer()
                doneButton()
            }

            TextField("Title", text: $jobTitle, axis: .horizontal)
                .font(.largeTitle)
                .bold()

            TextField("Details", text: $jobDetails, axis: .horizontal)
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
        return Button(action: {
            let job = Job(context: context)
            job.title = jobTitle
            job.details = jobDetails
            job.deadline = jobDeadline
            try? context.save()
        }, label: {
            Text("Done")
        })
    }
}

#Preview {
    EditJobView()
        .environment(\.managedObjectContext, DataController().container.viewContext)
}
