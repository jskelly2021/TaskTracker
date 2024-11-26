//
//  DeadlinePicker.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/23/24.
//

import SwiftUI

struct DeadlinePicker: View {
    @ObservedObject var job: Job

    var body: some View {
        timeScaleSelector()
        deadlinePicker()
    }


    func timeScaleSelector() -> some View {
        HStack {
            Text("Repeats")
                .font(.headline)

            Picker("TimeScale", selection: $job.timeScale) {
                ForEach(TimeScales.allCases) { option in
                    Text("\(option.description)")
                        .tag(option.rawValue)
                }
            }
            .pickerStyle(.segmented)
        }
    }

    func deadlinePicker() -> some View {
        ZStack {
            if job.timeScale == TimeScales.single.rawValue {
                DatePicker("Single", selection: $job.deadline.fallback(Date()), displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
            else if job.timeScale == TimeScales.daily.rawValue {
                DailyPicker()
            }
            else if job.timeScale == TimeScales.monthly.rawValue {
                DatePicker("Monthly Start Date", selection: $job.deadline.fallback(Date()), displayedComponents: .date)
                    .datePickerStyle(.graphical)
            }
            else {
                HStack {
                    Spacer()
                    Text("No Dates Available")
                        .foregroundColor(.gray)
                        .padding()
                    Spacer()
                }
            }
        }
        .id(job.deadline ?? Date())
        .transition(.slide)
        .animation(.snappy, value: job.timeScale)
    }
}

#Preview {
    let context = DataController(inMemory: true).container.viewContext
    let job = Job(context: context)
    job.title = "Sample Task"
    job.details = "A simple task for testing the preview."
    job.timeScale = 0
    job.deadline = Date()

    return DeadlinePicker(job: job)
        .environment(\.managedObjectContext, context)
}
