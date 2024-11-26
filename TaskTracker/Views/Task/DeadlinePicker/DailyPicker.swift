//
//  DailyPicker.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/26/24.
//

import SwiftUI

struct DailyPicker: View {
    @Binding var selectedDays: Array<Days>

    var body: some View {
        VStack {
            Text("Select Days")
                .font(.title)

            HStack {
                Spacer()
                ForEach(Days.allCases, id: \.self) { day in
                    dayItem(day: day)
                }
                Spacer()
            }
        }
    }

    func dayItem(day: Days) -> some View {
        Button {
            print("Selected \(day.description)")
        }
        label: {
            ZStack {
                Circle()
                    .fill(selectedDays.contains(day) ? Color.blue : Color.gray)
                Text(day.abbrieviate)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

#Preview {
    let days = [Days.Monday, Days.Wednesday, Days.Friday, Days.Saturday]
    DailyPicker(selectedDays: .constant(days))
}
