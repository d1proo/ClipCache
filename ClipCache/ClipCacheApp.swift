import SwiftUI
import SwiftData

@main
struct ClipCacheApp: App {
	var body: some Scene {
		WindowGroup {
			ContentView()
		}
		.modelContainer(for: ClipItem.self)
	}
}
