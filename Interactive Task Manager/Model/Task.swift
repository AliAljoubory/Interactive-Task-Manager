//
//  Task.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 12/03/2025.
//

import Foundation

struct Task {
    
    var title: String
    var taskDescription: String
    var priority: String
    var date: Date
}

struct MockTask {
    
    //Used only for UI testing during development
    
    static let sampleTask1 = Task(title: "This is a mock test title 1",
                                  taskDescription: "This is mock task description 1. This will be a very long task description to test out how long it can keep going until the cell gets truncated and doesn't look nice anymore.",
                                  priority: "low",
                                  date: Date())
    
    static let sampleTask2 = Task(title: "This is a mock test title 2",
                                  taskDescription: "This is mock task description 2",
                                  priority: "high",
                                  date: Date())
    
    static let sampleTask3 = Task(title: "This is a mock test title 3",
                                  taskDescription: "",
                                  priority: "medium",
                                  date: Date())
    
    static let sampleTask4 = Task(title: "This is a mock test title 4",
                                  taskDescription: "Hello task description",
                                  priority: "medium",
                                  date: Date().addingTimeInterval(TimeInterval(3600000)))
    static let sampleTask5 = Task(title: "This is a mock test title 5",
                                  taskDescription: "Hello",
                                  priority: "low",
                                  date: Date().addingTimeInterval(TimeInterval(3600000)))
    
    static let sampleTask6 = Task(title: "This is a mock test title 6",
                                  taskDescription: "Hello another task description this one is not that long but slightly long anyway for testing purposes.",
                                  priority: "high",
                                  date: Date().addingTimeInterval(TimeInterval(1500)))
    
    static let sampleTask7 = Task(title: "This is a mock test title 7 and another long title for testing purposes!",
                                  taskDescription: "",
                                  priority: "high",
                                  date: Date().addingTimeInterval(TimeInterval(25000)))
    
    static let sampleTask8 = Task(title: "Title 8",
                                  taskDescription: "Hi",
                                  priority: "low",
                                  date: Date())
    
    static let tasks = [sampleTask1, sampleTask2, sampleTask3, sampleTask4, sampleTask5, sampleTask6, sampleTask7, sampleTask8]
}

