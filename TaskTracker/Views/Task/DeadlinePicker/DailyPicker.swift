//
//  DailyPicker.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/26/24.
//

import SwiftUI

struct DailyPicker: View {
    @Binding var selectedDays: Set<Days>

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
            selectDay(day: day)
        }
        label: {
            ZStack {
                Circle()
                    .fill(selectedDays.contains(day) ? Color.blue : Color.gray.opacity(0.5))
                Text(day.abbrieviate)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }

    private func selectDay(day: Days) {
           if selectedDays.contains(day) {
               selectedDays.remove(day)
           } else {
               selectedDays.insert(day)
           }
       }
}

#Preview {
    let days:Set<Days> = [Days.Monday, Days.Wednesday, Days.Friday, Days.Saturday]
    DailyPicker(selectedDays: .constant(days))
}
