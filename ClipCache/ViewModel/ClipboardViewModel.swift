import SwiftUI
import SwiftData
import Combine

@MainActor
class ClipboardViewModel: ObservableObject {
	@Published var searchText = ""
	@Published var selectedCategory = "All"
	@Published var showingAddSheet = false
	@Published var editingItem: ClipItem?
	@Published var items: [ClipItem] = []
	
	private var modelContext: ModelContext?
	private let feedbackGenerator = UINotificationFeedbackGenerator()
	
	// Инициализация с контекстом
	func setup(with context: ModelContext) {
		self.modelContext = context
		fetchItems()
	}
	
	// Загрузка всех элементов
	func fetchItems() {
		guard let modelContext = modelContext else { return }
		
		do {
			let descriptor = FetchDescriptor<ClipItem>(
				sortBy: [SortDescriptor(\.dateCreated, order: .reverse)]
			)
			items = try modelContext.fetch(descriptor)
		} catch {
			print("Failed to fetch items: \(error)")
			items = []
		}
	}
	
	// Фильтрация элементов
	var filteredItems: [ClipItem] {
		if searchText.isEmpty && selectedCategory == "All" {
			return items
		}
		
		return items.filter { item in
			let matchesSearch = searchText.isEmpty ||
				item.title.localizedCaseInsensitiveContains(searchText) ||
				item.content.localizedCaseInsensitiveContains(searchText)
			
			let matchesCategory = selectedCategory == "All" || item.category == selectedCategory
			
			return matchesSearch && matchesCategory
		}
	}
	
	// Получение категорий
	var categories: [String] {
		let allItems = items.map { $0.category }
		return ["All"] + Array(Set(allItems)).sorted()
	}
	
	// Копирование в буфер обмена
	func copyToClipboard(_ text: String) {
		UIPasteboard.general.string = text
		feedbackGenerator.notificationOccurred(.success)
	}
	
	// Добавление элемента
	func addItem(title: String, content: String, category: String) {
		guard let modelContext = modelContext else { return }
		
		let newItem = ClipItem(title: title, content: content, category: category)
		modelContext.insert(newItem)
		saveContext()
		fetchItems()
	}
	
	// Обновление элемента
	func updateItem(_ item: ClipItem, title: String, content: String, category: String) {
		item.title = title
		item.content = content
		item.category = category
		saveContext()
		fetchItems()
	}
	
	// Удаление элемента
	func deleteItem(_ item: ClipItem) {
		guard let modelContext = modelContext else { return }
		
		modelContext.delete(item)
		saveContext()
		fetchItems()
	}
	
	// Сохранение контекста
	private func saveContext() {
		guard let modelContext = modelContext else { return }
		
		do {
			try modelContext.save()
		} catch {
			print("Failed to save context: \(error)")
		}
	}
}
