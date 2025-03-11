//
//  InteractiveTaskManagerTabView.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 11/03/2025.
//

import SwiftUI

struct InteractiveTaskManagerTabView: View {
    
    // MARK: View
    
    var body: some View {
        TabView {
            Tab("Tasks", systemImage: "inset.filled.circle") {
                TaskListView()
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsView()
            }
        }
        .tint(.accent)
    }
}

#Preview {
    InteractiveTaskManagerTabView()
}
