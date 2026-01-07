//
//  EmptyStateView.swift
//  ToDoApp
//
//  Created by Amrit Raj on 06/01/26.
//
import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "checklist")
                .font(.largeTitle)
                .foregroundColor(.secondary)

            Text("No Tasks Yet")
                .font(.headline)

            Text("Tap + to add your first task")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
    }
}

