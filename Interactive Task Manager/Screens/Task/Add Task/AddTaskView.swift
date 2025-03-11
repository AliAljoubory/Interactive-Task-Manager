//
//  AddTaskView.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 12/03/2025.
//

import SwiftUI

struct AddTaskView: View {
    
    // MARK: Properties
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = AddTaskViewModel()
    
    // MARK: View
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .accessibilityIdentifier("title textfield")
                
                TextField("Description (Optional)", text: $viewModel.description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .accessibilityIdentifier("description textfield")
                
                Text("Priority")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .accessibilityIdentifier("priority text")
                
                Picker("Priority", selection: $viewModel.priority) {
                    ForEach(viewModel.priorities, id: \.self) { Text($0) }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .accessibilityIdentifier("priority picker")
                
                DatePicker("Due Date", selection: $viewModel.date, in: Date()..., displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .tint(.accent)
                    .padding(.horizontal)
                    .accessibilityIdentifier("date picker")
                
                Button(action: saveTask) {
                    Text("Save Task")
                }
                .modifier(StandardButtonStyle())
                .padding(.horizontal)
                .accessibilityIdentifier("save task button")
                
                Spacer()
            }
            .navigationTitle(viewModel.title)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
            .alert(item: $viewModel.alertItem) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
        }
    }
    
    // MARK: Save Task
    
    private func saveTask() {
        guard !viewModel.title.isEmpty else {
            viewModel.alertItem = AlertContext.invalidTask
            return
        }
        
        withAnimation {
            PersistenceController.shared.addTask(
                title: viewModel.title,
                taskDescription: viewModel.description,
                priority: viewModel.priority,
                date: viewModel.date,
                context: viewContext
            )
        }
        
        dismiss()
    }
}

#Preview {
    AddTaskView()
}
