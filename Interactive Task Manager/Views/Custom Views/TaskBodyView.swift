//
//  TaskBodyView.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 13/03/2025.
//

import SwiftUI

struct TaskBodyView: View {
    
    // MARK: Properties
    
    let task: InteractiveTask
    
    // MARK: View
    
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 10) {
                Text("\(task.title ?? "")")
                    .font(.headline)
                Text("\(task.taskDescription ?? "")")
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                Text("Priority: \(task.priority ?? "")")
                    .font(.footnote)
            }
            .foregroundStyle(Color(.white))
            .fontWeight(.semibold)
            
            Spacer()
            
            Text("\(task.date?.formattedBasedOnCalendar() ?? "")")
                .fontWeight(.bold)
                .foregroundStyle(Color(.white))
        }
    }
}
