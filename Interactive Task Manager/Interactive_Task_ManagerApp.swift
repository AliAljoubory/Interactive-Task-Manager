//
//  Interactive_Task_ManagerApp.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 11/03/2025.
//

import SwiftUI

@main
struct Interactive_Task_ManagerApp: App {
    
    // MARK: Properties
    
    let persistenceController = PersistenceController.shared
    
    // MARK: View
    
    var body: some Scene {
        WindowGroup {
            InteractiveTaskManagerTabView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
