//
//  ListVIew.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListVIew: View {
    @State var items: [String] = [
        "item 1", "item 2", "item 3"
    ]
    
    var body: some View {

        List {
            ForEach(items.indices, id: \.self) { item in
                Text(items[item])
            }
        }
        
    }
}

#Preview {
    ListVIew()
}
