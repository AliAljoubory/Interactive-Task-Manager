//
//  AddTaskViewModel.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 12/03/2025.
//

import SwiftUI

final class AddTaskViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var priority: String = "Medium"
    @Published var date: Date = Date()
    @Published var alertItem: AlertItem?
    
    let priorities = ["Low", "Medium", "High"]
}
