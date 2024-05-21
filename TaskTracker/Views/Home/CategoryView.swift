//
//  CategoryView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/17/24.
//

import SwiftUI

struct CategoryView: View {
    let dim: CGFloat = 150
    var body: some View {
        VStack(spacing: 0) {

            HStack () {
                Spacer()
                CategoryPanel(name: "Priority", numTasks: 8, color: .saffron, dimension: dim)
                CategoryPanel(name: "Upcoming", numTasks: 13, color: .electricBlue, dimension: dim)
                Spacer()
            }

            HStack {
                Spacer()
                CategoryPanel(name: "Create", icon: "plus.circle", color: .gray, dimension: 100)
                Spacer()
            }

            HStack () {
                Spacer()
                CategoryPanel(name: "Groups", numTasks: 9, color: .skyMagenta, dimension: dim)
                CategoryPanel(name: "Overdue", numTasks: 3, color: .tomato, dimension: dim)
                Spacer()
            }
        }
        
    }
}

#Preview {
    CategoryView()
}
