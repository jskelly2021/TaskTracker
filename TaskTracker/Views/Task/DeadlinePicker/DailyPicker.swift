//
//  DailyPicker.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/26/24.
//

import SwiftUI

struct DailyPicker: View {
    let weekdays = ["S", "M", "T", "W", "T", "F", "S"]

    var body: some View {
        VStack {
            Text("Select Days")

            HStack {
                ForEach(weekdays, id: \.self) { day in
                    Text(day)
                }
                .padding()
            }
        }
    }
}

#Preview {
    DailyPicker()
}
