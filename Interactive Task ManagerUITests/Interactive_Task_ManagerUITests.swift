//
//  Interactive_Task_ManagerUITests.swift
//  Interactive Task ManagerUITests
//
//  Created by Ali Aljoubory on 11/03/2025.
//

import XCTest
@testable import Interactive_Task_Manager

final class Interactive_Task_ManagerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        super.setUp()
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDownWithError() throws {
        app = nil
        super.tearDown()
    }
    
    // MARK: TaskListView
    
    func testAddNewTaskButtonExists() {
        let addTaskButton = app.buttons["add task button"]
        XCTAssertTrue(addTaskButton.exists, "Add Task button is not visible")
    }
    
    // MARK: AddTaskView
    
    func testAddTaskViewUIElementsExist() {
        let addTaskButton = app.buttons["add task button"]
        XCTAssertTrue(addTaskButton.exists, "Add Task Button is not visible")
        
        addTaskButton.tap()
        
        let titleTextField = app.textFields["title textfield"]
        XCTAssertTrue(titleTextField.exists, "Title text field is not visible")
        
        titleTextField.tap()
        titleTextField.typeText("New task")
        
        let descriptionTextField = app.textFields["description textfield"]
        XCTAssertTrue(descriptionTextField.exists, "Description text field is not visible")
        
        descriptionTextField.tap()
        descriptionTextField.typeText("New description")
        
        let priorityText = app.staticTexts["priority text"]
        XCTAssertTrue(priorityText.exists, "Priority text is not visible")
        
        let lowPriorityButton = app.buttons["Low"]
        let mediumPriorityButton = app.buttons["Medium"]
        let highPriorityButton = app.buttons["High"]

        XCTAssertTrue(lowPriorityButton.exists, "Low priority button is not visible")
        XCTAssertTrue(mediumPriorityButton.exists, "Medium priority button is not visible")
        XCTAssertTrue(highPriorityButton.exists, "High priority button is not visible")

        highPriorityButton.tap()
        XCTAssertTrue(highPriorityButton.isSelected, "High priority button was not selected")
        
        let datePicker = app.datePickers["date picker"]
        XCTAssertTrue(datePicker.exists, "Date picker is not visible")
        
        let saveTaskButton = app.buttons["save task button"]
        XCTAssertTrue(saveTaskButton.exists, "Save task button is not visible")
    }
}
