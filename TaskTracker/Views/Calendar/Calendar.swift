////
////  Calendar.swift
////  TaskTracker
////
////  Created by Jacob Kelly on 5/28/24.
////
//
//import SwiftUI
//
//struct Calendar: View {
////    @State var date: Date = Date()
////    let daysOfWeek: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
////
////    let days: [GridItem] = [
////        GridItem(.flexible()),
////        GridItem(.flexible()),
////        GridItem(.flexible()),
////        GridItem(.flexible()),
////        GridItem(.flexible()),
////        GridItem(.flexible()),
////        GridItem(.flexible())
////    ]
////    
//    var body: some View {
//
////        VStack {
////            DatePicker("Select Month", selection: $date, displayedComponents: [.date])
////                .datePickerStyle(.graphical)
////            Spacer()
////            Text(date.formatted())
//
////
////            // TODO
////            // Month Picker
////            HStack {
////                Text(
////                    date.formatted(Date.FormatStyle()
////                        .month(.wide)
////                        .year(.defaultDigits)
////                    )
////                )
////                .padding(.leading)
////                Spacer()
////            }
////            
////            // Days of Week
////            HStack {
////                Spacer()
////                ForEach(daysOfWeek.indices, id: \.self) { day in
////                    Spacer()
////                    Text(daysOfWeek[day])
////                    Spacer()
////                }
////                Spacer()
////            }
////
////            // Days Grid
////            LazyVGrid(columns: days, content: {
////                ForEach(1..<8) { index in
////                    Text("\(index)")
////                }
////            })
////        }
////    }
////}
//
//
//#Preview {
//    Calendar()
//}
