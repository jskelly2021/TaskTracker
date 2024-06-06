//
//  ListView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListView: View {

//    @Binding var date: Date
//     var date: Date = Date()

//    @EnvironmentObject var taskModel: TaskModel

    var body: some View {

//        List {
//            Section(header: Text(date.formatted(date: .long, time: .omitted))) {
//                let currentDateComponents = Calendar.current.dateComponents([.day, .month, .year], from: date)
//
//                ForEach(taskModel.tasks.indices, id: \.self) { index in
//                        ListItem(item: taskModel.tasks[index])
//                }
//            }
//        }
//        .listStyle(.plain)
        
        Text("Working")
    }
}

#Preview {
    ListView()
        .environmentObject(TaskModel())
}
