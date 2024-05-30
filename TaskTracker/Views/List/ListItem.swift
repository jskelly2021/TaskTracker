//
//  ListItem.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListItem: View {
    
    let item: Task

    let date1 = Calendar.current.date(
            from: DateComponents(
            calendar: Calendar.current,
            year: 2024,
            month: 5,
            day: 31)
        ) ?? Date()


    var date2: Date = Date()

    var body: some View {

        HStack {
            Spacer()
            Text(item.name)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
            Spacer()
            Text(item.status)
                .lineLimit(1)
            Spacer()
            Text("Details: \(item.details)")
                .lineLimit(2)
            Spacer()
        }
        
//        VStack {
//            Text("Date 1: \(date1)")
//            Text("Date 2: \(date2)")
//            
//            let c1 = Calendar.current.dateComponents([.day, .month, .year], from: date1)
//            let c2 = Calendar.current.dateComponents([.day, .month, .year], from: date2)
//
//            if (c1 == c2) {
//                Text("True")
//            }
//            else {
//                Text("False")
//            }
//            
//        }
    }
}

#Preview {
    ListItem(item: Task(name: "Oil", status: "Monthly", details: "Full Synthetic", deadline: Date.init(), group: "Indoor", priority: false))
}
