//
//  CategoryPanel.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/17/24.
//

import SwiftUI

struct CategoryPanel: View {
    let name: String
    let numTasks: Int
    let color: Color

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(
                    width: 150,
                    height: 200)
                .shadow(
                    color: .black,
                    radius: 10,
                    x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10.0)
                .padding(.all, 10)
            VStack {
                Text(name)
                    .font(.title)
                    .bold()
                Text("\(numTasks) tasks")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    CategoryPanel(name:"Priority", numTasks: 8, color: .red)
}
