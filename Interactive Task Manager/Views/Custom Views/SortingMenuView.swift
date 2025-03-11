//
//  SortingMenuView.swift
//  Interactive Task Manager
//
//  Created by Ali Aljoubory on 12/03/2025.
//

import SwiftUI

struct SortMenuView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: TaskListViewModel
    
    // MARK: View
    
    var body: some View {
        Menu {
            Button {
                viewModel.currentSortOption = .priority
            } label: {
                Text("Sort by Priority")
            }
            .accessibilityIdentifier("priority button")
            
            Button {
                viewModel.currentSortOption = .date
            } label: {
                Text("Sort by Date")
            }
            .accessibilityIdentifier("date button")
            
            Button {
                viewModel.currentSortOption = .title
            } label: {
                Text("Sort by Title")
            }
            .accessibilityIdentifier("title button")
            
        } label: {
            Image(systemName: "arrow.up.arrow.down.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(10)
                .tint(.accent)
        }
    }
}

struct SortMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SortMenuView(viewModel: TaskListViewModel())
    }
}
