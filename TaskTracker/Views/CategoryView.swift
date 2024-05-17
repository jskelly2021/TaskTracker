//
//  CategoryView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/17/24.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        HStack {
            CategoryPanel(name: "Priority", numTasks: 8, color: .yellow)
            CategoryPanel(name: "Upcoming", numTasks: 13, color: .blue)
        }
        HStack {
            CategoryPanel(name: "Groups", numTasks: 9, color: .purple)
            CategoryPanel(name: "Overdue", numTasks: 3, color: .red)
        }
    }
}

#Preview {
    CategoryView()
}
