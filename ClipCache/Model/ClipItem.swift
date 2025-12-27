import SwiftData
import Foundation

@Model
class ClipItem {
	var id: UUID
	var title: String
	var content: String
	var category: String
	var dateCreated: Date
	
	init(title: String, content: String, category: String = "General") {
		self.id = UUID()
		self.title = title
		self.content = content
		self.category = category
		self.dateCreated = Date()
	}
}
