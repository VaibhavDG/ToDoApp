import SwiftUI

struct TaskRowView: View {
    @ObservedObject var task: TaskItem
    let onToggle: () -> Void

    var body: some View {
        HStack(spacing: 12) {

            
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .secondary)
                .font(.title3)
                .onTapGesture {
                    withAnimation(.spring()) {
                        onToggle()
                    }
                }

            VStack(alignment: .leading, spacing: 4) {
                Text(task.title ?? "Untitled Task")
                    .font(.headline)
                    .strikethrough(task.isCompleted)
                    .foregroundColor(task.isCompleted ? .secondary : .primary)

                Text(task.dueDate ?? Date(),style: .date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            
            Circle()
                .fill(priorityColor)
                .frame(width: 8, height: 8)
        }
        .padding(.vertical, 4)
    }

    private var priorityColor: Color {
        switch task.priority {
        case 1: return .green
        case 2: return .blue
        case 3: return .orange
        default: return .red
        }
    }
}

