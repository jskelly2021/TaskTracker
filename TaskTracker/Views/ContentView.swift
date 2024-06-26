//
//  ContentView.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { 
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem { 
                    Label("Search", systemImage: "magnifyingglass")
                }
            CalendarView()
                .tabItem { 
                    Label("Calendar", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    ContentView()
}
