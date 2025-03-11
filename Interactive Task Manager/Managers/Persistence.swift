//
//  Persistence.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 11/03/2025.
//

import CoreData

struct PersistenceController {
    
    // MARK: Properties
    
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    // MARK: Init
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Interactive_Task_Manager")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: C.R.U.D
    
    public func addTask(title: String, taskDescription: String?, priority: String, date: Date, context: NSManagedObjectContext) {
        let newTask = InteractiveTask(context: context)
        newTask.title = title
        newTask.taskDescription = taskDescription
        newTask.priority = priority
        newTask.date = date
        
        saveContext(context: context)
    }
    
    public func deleteTask(task: InteractiveTask, context: NSManagedObjectContext) {
        context.delete(task)
        saveContext(context: context)
    }
    
    private func saveContext(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

extension PersistenceController {
    
    // MARK: Preview
    
    @MainActor
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newTask = InteractiveTask(context: viewContext)
            newTask.title = "Sample Task"
            newTask.taskDescription = "This is a sample description."
            newTask.priority = "Medium"
            newTask.date = Date()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
