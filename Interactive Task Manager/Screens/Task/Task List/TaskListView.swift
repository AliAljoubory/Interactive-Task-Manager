//
//  TaskListView.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 11/03/2025.
//

import SwiftUI

struct TaskListView: View {
    
    // MARK: Properties
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [], animation: .default)
    
    private var tasks: FetchedResults<InteractiveTask>
    
    @StateObject private var viewModel = TaskListViewModel()
    @State private var isShowingAddTaskView: Bool = false
    @Namespace private var animationNamespace
    
    // MARK: View
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    List {
                        ForEach(tasks) { task in
                            TaskListViewCell(task: task)
                                .listRowSeparator(.hidden)
                                .onTapGesture {
                                    withAnimation(.easeInOut(duration: 0.2)) {
                                        viewModel.selectedTask = task
                                        viewModel.isShowingDetail = true
                                    }
                                }
                                .matchedGeometryEffect(id: task.hash, in: animationNamespace)
                        }
                        .onDelete(perform: deleteTask)
                    }
                    .disabled(viewModel.isShowingDetail)
                    .blur(radius: viewModel.addBlurIfShowingDetail())
                    .animation(.easeInOut(duration: 0.2), value: viewModel.isShowingDetail)
                    
                    if tasks.isEmpty {
                        EmptyState()
                    }
                    
                    if viewModel.isShowingDetail, let selectedTask = viewModel.selectedTask {
                        TaskDetailView(task: selectedTask, isShowingDetail: $viewModel.isShowingDetail)
                            .matchedGeometryEffect(id: selectedTask.hash, in: animationNamespace, isSource: false)
                            .transition(.asymmetric(insertion: .scale(scale: 0.9).combined(with: .opacity), removal: .opacity))
                            .zIndex(1)
                    }
                }
                
                Spacer()
                
                Button {
                    isShowingAddTaskView = true
                } label: {
                    Label("Add Task", systemImage: "plus")
                }
                .modifier(StandardButtonStyle())
                .padding(20)
                .disabled(viewModel.isShowingDetail)
                .blur(radius: viewModel.addBlurIfShowingDetail())
                .accessibilityIdentifier("add task button")
            }
            .onReceive(viewModel.$sortDescriptors) { newSortDescriptors in
                _tasks.wrappedValue.nsSortDescriptors = newSortDescriptors
            }
            .listStyle(.plain)
            .navigationBarItems(
                trailing: SortMenuView(viewModel: viewModel)
                    .disabled(viewModel.isShowingDetail)
                    .blur(radius: viewModel.addBlurIfShowingDetail())
            )
            .toolbarBackground(.hidden, for: .tabBar)
            .sheet(isPresented: $isShowingAddTaskView) {
                AddTaskView()
            }
        }
    }
    
    // MARK: Delete Task
    
    private func deleteTask(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach { task in
                PersistenceController.shared.deleteTask(task: task, context: viewContext)
            }
        }
    }
}

#Preview {
    TaskListView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
