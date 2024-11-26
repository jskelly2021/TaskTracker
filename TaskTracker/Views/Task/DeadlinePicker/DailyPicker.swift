//
//  DailyPicker.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/26/24.
//

import SwiftUI

struct DailyPicker: View {
    var body: some View {
        VStack {
            Text("Select Days")

            HStack {
                ForEach(Days.allCases, id: \.self) { day in
                    Text(day.description)
                }
                .padding()
            }
        }
    }
}

#Preview {
    DailyPicker()
}
