//
//  TaskView.swift
//  ToDoApp
//
//  Created by Amrit Raj on 06/01/26.
//
import SwiftUI
import CoreData

struct AddTaskView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss

    @State private var title = ""
    @State private var priority = 1
    @State private var dueDate = Date()

    var body: some View {
        NavigationView {
            Form {
                TextField("Task Title", text: $title)

                Stepper("Priority: \(priority)", value: $priority, in: 1...5)

                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        addTask()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: { dismiss() })
                }
            }
        }
    }

    private func addTask() {
        let newTask = TaskItem(context: viewContext)
        newTask.title = title
        newTask.priority = Int16(priority)
        newTask.dueDate = dueDate
        newTask.timestamp = Date()

        try? viewContext.save()
    }
}

