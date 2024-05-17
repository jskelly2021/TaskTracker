//
//  CategoryPanel.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/17/24.
//

import SwiftUI

struct CategoryPanel: View {
    var categoryName: String = "Priority"
    var numTasksInCategory: Int = 8

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.red)
                .frame(
                    width: 150,
                    height: 200,
                    alignment: .center)
                .shadow(
                    color: .black,
                    radius: 10,
                    x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 10.0)
                .padding(.all, 10)
            VStack {
                Text(categoryName)
                    .font(.title)
                    .bold()
                Text("\(numTasksInCategory) tasks")
                    .font(.caption)
            }

        }
    }
}

#Preview {
    CategoryPanel()
}
