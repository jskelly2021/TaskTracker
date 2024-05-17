//
//  HomeView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/17/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home")
                .font(.largeTitle)
                .bold()

            HStack {
                CategoryPanel()
                CategoryPanel()
            }
            HStack {
                CategoryPanel()
                CategoryPanel()
            }
        }
    }
}

#Preview {
    HomeView()
}
