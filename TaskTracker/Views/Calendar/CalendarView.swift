//
//  CalendarView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/21/24.
//

import SwiftUI

struct CalendarView: View {
    @State var date: Date = Date()

    var body: some View {
        VStack {
            Text("Calendar")
                .font(.largeTitle)
                .bold()
            
            DatePicker("Select Month", selection: $date, displayedComponents: [.date])
                .datePickerStyle(.graphical)

            ListView(date: $date)
        }
    }
}

#Preview {
    CalendarView()
}
