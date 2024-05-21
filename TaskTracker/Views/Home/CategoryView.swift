//
//  CategoryView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/17/24.
//

import SwiftUI

struct CategoryView: View {
    let space: CGFloat = 25
    var body: some View {
        VStack(spacing: -space) {

            HStack (spacing: space) {
                Spacer()
                CategoryPanel(name: "Priority", numTasks: 8, color: .yellow, dimension: 150)
                CategoryPanel(name: "Upcoming", numTasks: 13, color: .blue, dimension: 150)
                Spacer()
            }

            HStack {
                Spacer()
                CategoryPanel(name: "Create", icon: "plus.circle", color: .gray, dimension: 75)
                Spacer()

            }

            HStack (spacing: space) {
                Spacer()
                CategoryPanel(name: "Groups", numTasks: 9, color: .purple, dimension: 150)
                CategoryPanel(name: "Overdue", numTasks: 3, color: .red, dimension: 150)
                Spacer()
            }
        }
        
    }
}

#Preview {
    CategoryView()
}
