//
//  HexPanel.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/21/24.
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

struct HexPanel: View {
    var body: some View {

        Hexagon()
            .frame(width: 100, height: 100)

    }
}

#Preview {
    HexPanel()
}
