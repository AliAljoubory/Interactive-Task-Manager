//
//  Alert.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 13/03/2025.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    // MARK: Basic errors
    
    static let invalidTask = AlertItem(title: Text("Invalid Task"),
                                       message: Text("Please ensure a title is set for your task."),
                                       dismissButton: .default(Text("Ok")))
    
}
