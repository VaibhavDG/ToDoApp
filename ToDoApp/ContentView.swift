import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TaskItem.dueDate, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<TaskItem>

    @State private var showAddTask = false

    var body: some View {
        NavigationView {
            List {
                if tasks.isEmpty {
                    EmptyStateView()
                } else {
                    ForEach(tasks) { task in
                        TaskRowView(task: task){
                            toggleCompletion(for:task)
                        }
                            .swipeActions {
                                Button(role: .destructive) {
                                    delete(task)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }

                }
            }

            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddTask.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                AddTaskView()
            }
        }
    }

    private func deleteTask(offsets: IndexSet) {
        offsets.map { tasks[$0] }.forEach(viewContext.delete)
        try? viewContext.save()
    }
    private func delete(_ task: TaskItem) {
        viewContext.delete(task)
        try? viewContext.save()
    }
    private func toggleCompletion(for task: TaskItem) {
        task.isCompleted.toggle()
        try? viewContext.save()
    }


}


#Preview {
    ContentView()
}
