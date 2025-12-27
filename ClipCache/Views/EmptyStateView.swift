import SwiftUI

struct EmptyStateView: View {
	var body: some View {
		VStack(spacing: 20) {
			Image(systemName: "doc.on.clipboard")
				.font(.system(size: 50))
				.foregroundColor(.gray)
			
			Text("No clips yet")
				.font(.title2)
			
			Text("Tap + to add your first clip")
				.foregroundColor(.secondary)
		}
	}
}
