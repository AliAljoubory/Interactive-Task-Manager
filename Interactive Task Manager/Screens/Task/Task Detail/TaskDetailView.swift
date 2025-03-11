//
//  TaskDetailView.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 13/03/2025.
//

import SwiftUI

struct TaskDetailView: View {
    
    // MARK: Properties
    
    @Environment(\.managedObjectContext) private var viewContext
    
    let task: InteractiveTask
    @Binding var isShowingDetail: Bool
    
    // MARK: View
    
    var body: some View {
        VStack {
            TaskBodyView(task: task)
            
            // Note: For simplicity, I kept the functionality of both buttons the same (delete task)
            // as I didn't have enough time to create completed tasks and store them in Core Data
            
            HStack(spacing: 30) {
                Button {
                    deleteTask()
                } label: {
                    Text("Delete")
                }
                .modifier(DetailButtonStyle())
                
                Button {
                    deleteTask()
                } label: {
                    Text("Completed")
                }
                .modifier(DetailButtonStyle())
            }
        }
        .padding(20)
        .background(Color(.systemPink))
        .cornerRadius(8)
    }
    
    // MARK: Delete Task
    
    private func deleteTask() {
        withAnimation {
            PersistenceController.shared.deleteTask(task: task, context: viewContext)
            isShowingDetail = false
        }
    }
}
