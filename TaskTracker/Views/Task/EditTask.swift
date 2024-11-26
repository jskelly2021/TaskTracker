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

    @ObservedObject var job: Job

    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            jobDescription()
            DeadlinePicker(job: job)

            HStack {
                Spacer()
                deleteButton()
                Spacer()
            }
        }
    }

    // Title and Details
    func jobDescription() -> some View {
        VStack {
            TextField("Title", text: $job.title.fallback(""), axis: .vertical)
                .lineLimit(3)
                .font(.largeTitle)
                .bold()

            TextField("Details", text: $job.details.fallback(""), axis: .vertical)
                .lineLimit(5, reservesSpace: true)
                .font(.headline)
        }
    }

    func deleteButton() -> some View {
        Button {
            context.delete(job)
            try? context.save()
            dismiss()
        }
        label: {
            Image(systemName: "trash")
                .foregroundColor(.red)
                .padding(8)
            }
    }
}

#Preview {
    let context = DataController(inMemory: true).container.viewContext
    let job = Job(context: context)
    job.title = "Sample Task"
    job.details = "A simple task for testing the preview."
    job.timeScale = 0
    job.deadline = Date()

    return EditTask(job: job)
        .environment(\.managedObjectContext, context)
}
