import SwiftUI
import SwiftData

struct ContentView: View {
	@Environment(\.modelContext) private var modelContext
	@StateObject private var viewModel = ClipboardViewModel()
	
	var body: some View {
		NavigationView {
			VStack {
				// Поиск
				SearchBar(text: $viewModel.searchText)
					.padding(.horizontal)
					.padding(.top)
				
				// Категории
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 8) {
						ForEach(viewModel.categories, id: \.self) { category in
							CategoryChip(
								title: category,
								isSelected: viewModel.selectedCategory == category,
								action: { viewModel.selectedCategory = category }
							)
						}
					}
					.padding(.horizontal)
				}
				.padding(.vertical, 8)
				
				// Список
				if viewModel.filteredItems.isEmpty {
					EmptyStateView()
						.frame(maxHeight: .infinity)
				} else {
					List {
						ForEach(viewModel.filteredItems) { item in
							ClipItemRow(
								item: item,
								onCopy: { viewModel.copyToClipboard(item.content) },
								onEdit: { viewModel.editingItem = item },
								onDelete: { viewModel.deleteItem(item) }
							)
							.swipeActions(edge: .trailing) {
								Button(role: .destructive) {
									viewModel.deleteItem(item)
								} label: {
									Label("Delete", systemImage: "trash")
								}
								
								Button {
									viewModel.editingItem = item
								} label: {
									Label("Edit", systemImage: "pencil")
								}
								.tint(.blue)
							}
						}
					}
					.listStyle(PlainListStyle())
				}
			}
			.navigationTitle("ClipCache")
			.toolbar {
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(action: { viewModel.showingAddSheet = true }) {
						Image(systemName: "plus")
					}
				}
			}
			.sheet(isPresented: $viewModel.showingAddSheet) {
				AddEditView(
					onSave: { title, content, category in
						viewModel.addItem(title: title, content: content, category: category)
					}
				)
			}
			.sheet(item: $viewModel.editingItem) { item in
				AddEditView(
					editingItem: item,
					onSave: { title, content, category in
						viewModel.updateItem(item, title: title, content: content, category: category)
					}
				)
			}
		}
		.onAppear {
			viewModel.setup(with: modelContext)
		}
	}
}
