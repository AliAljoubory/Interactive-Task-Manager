//
//  Date+Ext.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 12/03/2025.
//

import Foundation

extension Date {
    
    func formattedBasedOnCalendar() -> String {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let targetDate = calendar.startOfDay(for: self)
        
        let components = calendar.dateComponents([.day], from: today, to: targetDate)
        
        let formatter = DateFormatter()
        
        // Checks if date is 'today' or 'tomorrow'.
        // If not but within next 6 days, returns shortened name of day (TUE).
        // If not, returns the date (12 Mar).
        
        if let dayDifference = components.day {
            switch dayDifference {
            case 0:
                return "Today"
            case 1:
                return "Tomorrow"
            case 2...6:
                formatter.dateFormat = "E"
                return formatter.string(from: self)
            default:
                formatter.dateFormat = "d MMM"
                return formatter.string(from: self)
            }
        }
        
        return formatter.string(from: self)
    }
}
