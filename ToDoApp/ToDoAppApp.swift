//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Amrit Raj on 06/01/26.
//
import SwiftUI
import CoreData

@main
struct ToDoAppApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
