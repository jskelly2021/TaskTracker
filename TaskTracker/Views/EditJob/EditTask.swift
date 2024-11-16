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

    @Binding var job: Job

    @State var jobTitle: String = ""

    var body: some View {
        VStack(alignment: .center, spacing: 10.0) {
            TextField("Title", text: $job.title.fallback(""), axis: .vertical)
                .lineLimit(3)
                .font(.largeTitle)
                .bold()

            TextField("Details", text: $job.details.fallback(""), axis: .vertical)
                .lineLimit(5)
                .font(.headline)

            Spacer()

            Text("Deadline")
                .font(.headline)
            DatePicker("Deadline", selection: $job.deadline.fallback(Date()), displayedComponents: .date)
                .datePickerStyle(.graphical)
                .id(job.deadline)

            Spacer()

            deleteButton()
        }
        .padding()
    }

    func deleteButton() -> some View {
        Button(action: deleteJob) {
            Image(systemName: "trash")
                .foregroundColor(.red)
                .padding(8)
            }
    }

    func deleteJob() {
        context.delete(job)
        try? context.save()
        dismiss()
    }
}
