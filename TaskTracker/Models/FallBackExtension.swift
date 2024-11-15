//
//  FallBackExtension.swift
//  TaskTracker
//
//  Created by Jacob Kelly on 11/15/24.
//

import SwiftUI

extension Binding {
    func fallback<T>(_ fallbackValue: T) -> Binding<T> where Value == T? {
        Binding<T>(
            get: { self.wrappedValue ?? fallbackValue },
            set: { newValue in
                self.wrappedValue = newValue
            }
        )
    }
}
