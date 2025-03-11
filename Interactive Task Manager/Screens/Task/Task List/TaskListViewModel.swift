//
//  TaskListViewModel.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 11/03/2025.
//

import SwiftUI

final class TaskListViewModel: ObservableObject {
    
    // MARK: Enum
    
    enum SortCases {
        case priority, date, title
    }
    
    // MARK: Properties
    
    @Published var isShowingDetail = false
    @Published var selectedTask: InteractiveTask?
    @Published var sortDescriptors: [NSSortDescriptor] = []
    
    @Published var currentSortOption: SortCases = .date {
        didSet {
            updateSortDescriptors()
        }
    }
    
    // MARK: Public
    
    public func addBlurIfShowingDetail() -> CGFloat {
        return isShowingDetail ? 20 : 0
    }
    
    // MARK: Sort
    
    private func updateSortDescriptors() {
        let sortDescriptor: NSSortDescriptor
        
        switch currentSortOption {
        case .priority:
            sortDescriptor = NSSortDescriptor(keyPath: \InteractiveTask.priority, ascending: true)
        case .date:
            sortDescriptor = NSSortDescriptor(keyPath: \InteractiveTask.date, ascending: true)
        case .title:
            sortDescriptor = NSSortDescriptor(keyPath: \InteractiveTask.title, ascending: true)
        }
        
        sortDescriptors = [sortDescriptor]
    }
}
