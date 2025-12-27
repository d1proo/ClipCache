import SwiftUI

struct ClipItemRow: View {
	let item: ClipItem
	let onCopy: () -> Void
	let onEdit: () -> Void
	let onDelete: () -> Void
	
	@State private var isPressed = false
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text(item.title)
				.font(.headline)
			
			Text(item.content)
				.font(.caption)
				.foregroundColor(.secondary)
				.lineLimit(2)
			
			HStack {
				Text(item.category)
					.font(.caption2)
					.padding(.horizontal, 8)
					.padding(.vertical, 4)
					.background(Color.blue.opacity(0.1))
					.cornerRadius(6)
				
				Spacer()
				
				Button(action: handleCopy) {
					Image(systemName: "doc.on.doc")
						.foregroundColor(.green)
				}
			}
		}
		.padding(.vertical, 12)
		.padding(.horizontal, 16)
		.background(
			RoundedRectangle(cornerRadius: 12)
				.fill(isPressed ? Color.gray.opacity(0.3) : Color(.systemBackground))
				.animation(.easeInOut(duration: 0.2), value: isPressed)
		)
		.overlay(
			RoundedRectangle(cornerRadius: 12)
				.stroke(isPressed ? Color.gray.opacity(0.3) : Color.clear, lineWidth: 2)
				.animation(.easeInOut(duration: 0.2), value: isPressed)
		)
		.scaleEffect(isPressed ? 0.99 : 1.0)
		.shadow(
			color: .black.opacity(0.1),
			radius: isPressed ? 1 : 3,
			x: 0,
			y: isPressed ? 0 : 2
		)
		.onTapGesture {
			handleCopy()
		}
	}
	
	private func handleCopy() {
		// 1. Нажимаем
		isPressed = true
		
		// 2. Копируем
		onCopy()
		
		// 3. Отпускаем через 0.2 секунды
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
			isPressed = false
		}
	}
}
