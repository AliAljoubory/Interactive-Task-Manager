//
//  TaskListViewCell.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 11/03/2025.
//

import SwiftUI

struct TaskListViewCell: View {
    
    // MARK: Properties
    
    let task: InteractiveTask
    
    // MARK: View
    
    var body: some View {
        TaskBodyView(task: task)
            .padding(20)
            .background(Color(.systemPink))
            .cornerRadius(8)
    }
}

#Preview {
    TaskListViewCell(task: InteractiveTask())
}
