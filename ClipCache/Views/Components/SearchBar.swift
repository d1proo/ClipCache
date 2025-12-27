import SwiftUI

struct SearchBar: View {
	@Binding var text: String
	
	var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")
				.foregroundColor(.gray)
			
			TextField("Search clips...", text: $text)
				.textFieldStyle(PlainTextFieldStyle())
		}
		.padding(10)
		.background(Color(.systemGray6))
		.cornerRadius(10)
	}
}
