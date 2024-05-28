//
//  Calendar.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct Calendar: View {
    let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {

        VStack {
            
            // TODO
            // Month Picker
            HStack {
                Text("May, 2024")
                    .padding(.leading)
                Spacer()
            }
            
            // Days Text
            HStack {
                Spacer()
                ForEach(days.indices, id: \.self) { day in
                    Spacer()
                    Text(days[day])
                    Spacer()
                }
                Spacer()
            }
        }
    }
}


#Preview {
    Calendar()
}
