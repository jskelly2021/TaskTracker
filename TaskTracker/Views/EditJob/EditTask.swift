//
//  EditJobView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 9/11/24.
//

import SwiftUI

struct EditTask: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss

    @Binding var jobTitle: String
    @Binding var jobDetails: String
    @Binding var jobDeadline: Date

    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
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

//            deleteButton()
        }
    }

//    func deleteButton() -> some View {
//        Button(action: deleteJob) {
//            Image(systemName: "trash")
//                .foregroundColor(.red)
//                .padding(8)
//            }
//    }
//
//    func deleteJob() {
//        context.delete(job)
//        try? context.save()
//        dismiss()
//    }
}

//#Preview {
//    let context = DataController().container.viewContext
//    let job = Job(context: context)
//    job.title = "Sample Task"
//    job.details = "A simple task for testing the preview."
//    job.deadline = Date()
//
//    return EditTask(job: .constant(job))
//        .environment(\.managedObjectContext, context)
//}
