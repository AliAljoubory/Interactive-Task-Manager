//
//  SettingsView.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 11/03/2025.
//

import SwiftUI

struct SettingsView: View {
    
#warning("TODO: This view is currently unfinished as I ran out of time!")
    
    // MARK: Properties
    
    @State private var colors = ["red", "blue", "green", "orange", "pink"]
    
    // MARK: View

    var body: some View {
        VStack {
            Text("Choose Your Accent Colour")
                .font(.title)
            
            Picker("Colour", selection: $colors) {
                ForEach(colors, id: \.self) { Text($0) }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
        }
    }
}

#Preview {
    SettingsView()
}
