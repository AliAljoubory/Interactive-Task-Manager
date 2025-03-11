//
//  CustomModifiers.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 12/03/2025.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(.accent)
            .foregroundColor(Color(.white))
            .cornerRadius(10)
    }
}

struct DetailButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 150, height: 50)
            .background(.accent)
            .buttonStyle(.bordered)
            .controlSize(.large)
            .foregroundStyle(Color(.white))
            .cornerRadius(10)
    }
}
