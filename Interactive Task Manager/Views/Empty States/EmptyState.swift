//
//  EmptyState.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 12/03/2025.
//

import SwiftUI

struct EmptyState: View {
    
    // MARK: View
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: "pencil.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 75)
                
                Text("Hooray!\nYou have no tasks right now.")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            .offset(y: -50)
        }
    }
}

#Preview {
    EmptyState()
}
