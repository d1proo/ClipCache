import SwiftUI

struct AddEditView: View {
	let onSave: (String, String, String) -> Void
	let editingItem: ClipItem?
	
	@Environment(\.dismiss) private var dismiss
	@State private var title = ""
	@State private var content = ""
	@State private var category = "General"
	
	private let categories = ["General", "Work", "Personal", "Code"]
	
	init(onSave: @escaping (String, String, String) -> Void) {
		self.onSave = onSave
		self.editingItem = nil
	}
	
	init(editingItem: ClipItem, onSave: @escaping (String, String, String) -> Void) {
		self.onSave = onSave
		self.editingItem = editingItem
		_title = State(initialValue: editingItem.title)
		_content = State(initialValue: editingItem.content)
		_category = State(initialValue: editingItem.category)
	}
	
	var body: some View {
		NavigationView {
			Form {
				Section("Details") {
					TextField("Title", text: $title)
					TextField("Content", text: $content, axis: .vertical)
						.lineLimit(3...6)
				}
				
				Section("Category") {
					Picker("Select", selection: $category) {
						ForEach(categories, id: \.self) { cat in
							Text(cat).tag(cat)
						}
					}
					.pickerStyle(.segmented)
				}
			}
			.navigationTitle(editingItem == nil ? "New Clip" : "Edit Clip")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) {
					Button("Cancel") {
						dismiss()
					}
				}
				
				ToolbarItem(placement: .navigationBarTrailing) {
					Button(editingItem == nil ? "Add" : "Save") {
						onSave(title, content, category)
						dismiss()
					}
					.disabled(title.isEmpty || content.isEmpty)
				}
			}
		}
	}
}
