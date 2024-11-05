//
//  ListItem.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 5/28/24.
//

import SwiftUI

struct ListItem: View {
    var job: Job
    var body: some View {
        Button(
            action: {
                
            },
            label: {
                Text(job.title ?? "na")
            }
        )
    }
}
