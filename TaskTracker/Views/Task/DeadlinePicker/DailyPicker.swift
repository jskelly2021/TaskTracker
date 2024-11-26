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
            print("Clicked")
        }
        label: {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                Text(day.abbrieviate)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

#Preview {
    DailyPicker()
}
