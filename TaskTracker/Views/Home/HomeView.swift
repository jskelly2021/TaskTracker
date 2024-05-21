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
            Spacer()
            Text("Home")
                .font(.largeTitle)
                .bold()
            CategoryView()
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
