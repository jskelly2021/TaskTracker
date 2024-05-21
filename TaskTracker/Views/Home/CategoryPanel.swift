//
//  CategoryPanel.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/17/24.
//

import SwiftUI

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let hOffset: CGFloat = rect.width * 0.3
            let vOffset: CGFloat = rect.height * 0.3

            path.move(to: CGPoint(x: rect.minX + hOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - hOffset, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + vOffset))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - vOffset))
            path.addLine(to: CGPoint(x: rect.maxX - hOffset, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + hOffset, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - vOffset))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + vOffset))
            path.addLine(to: CGPoint(x: rect.minX + hOffset, y: rect.minY))
        }
    }
}

struct CategoryPanel: View {
    let name: String
    let icon: String?
    let numTasks: Int?
    let color: Color
    let dimension: CGFloat

    init (name: String, icon: String? = nil, numTasks: Int? = nil, color: Color, dimension: CGFloat = 125.0) {
        self.name = name
        self.icon = icon
        self.numTasks = numTasks
        self.color = color
        self.dimension = dimension
    }

    var body: some View {
        ZStack {

            // Background
            Hexagon()
                .fill(color)
                .frame(
                    width: dimension,
                    height: dimension)
                .shadow(
                    color: .black,
                    radius: 11,
                    x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 8.0)

            // Body
            VStack (spacing: 0) {

                if let icon {
                    Image(systemName: "\(icon)")
                        .resizable()
                        .scaledToFit()
                        .bold()
                        .frame(width: dimension * 0.3)
                }

                Text(name)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.1)
                    .lineLimit(1)
                    .padding([.leading, .trailing], 5)
                    .bold()
                    .frame(width: dimension * 0.8)

                if let numTasks {
                    Text("\(numTasks) tasks")
                        .font(.system(size: 100))
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                        .frame(width: dimension * 0.4)
                }
            }
        }
    }
}


#Preview {
    CategoryPanel(name: "Upcoming", numTasks: 8, color: .red, dimension: 150)
//    CategoryPanel(name: "Create", icon: "plus.circle", color: .gray, dimension: 75)
}
