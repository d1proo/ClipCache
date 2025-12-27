import SwiftUI

struct CategoryChip: View {
	let title: String
	let isSelected: Bool
	let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			Text(title)
				.font(.caption)
				.padding(.horizontal, 12)
				.padding(.vertical, 6)
				.background(isSelected ? Color.blue : Color(.systemGray5))
				.foregroundColor(isSelected ? .white : .primary)
				.cornerRadius(15)
		}
	}
}
