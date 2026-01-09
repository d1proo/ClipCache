# 📋 ClipCache
A minimalist clipboard manager for iOS

## 📱 About the Project
**ClipCache** is a simple yet elegant application for storing and quickly accessing frequently used text snippets (template responses, code fragments, etc.). Perfect for developers, managers, writers, and anyone who regularly works with text.
<div align = "center">
<img width="220" src="https://github.com/user-attachments/assets/0377e9c8-cb30-4d9e-a891-dc96f76eaf38" />
<img width="220" src="https://github.com/user-attachments/assets/cbab4cae-0e38-4a75-a37f-f4d5219ffcb1" />
<img width="220" src="https://github.com/user-attachments/assets/6e50f3fa-2041-449b-965b-14bf229c1a81" />
<img width="220" src="https://github.com/user-attachments/assets/2f5140b6-b1bc-4e77-b338-121aa2a2ffb5" />
</div>

## ✨ Features
✅ Quick text note saving with categories

✅ One-tap copy to clipboard

✅ Smart search through content and titles

✅ Category filtering

✅ Clean minimalist design

✅ Local storage using SwiftData

✅ Haptic feedback when copying

## 🛠️ Technologies
- SwiftUI — User Interface
- SwiftData — Data persistence
- MVVM — Clean architecture for separation of concerns

## 📁 Project Structure

```
ClipCache/
├── ClipCacheApp.swift          # App entry point
├── Models/
│   └── ClipItem.swift          # SwiftData model
├── ViewModels/
│   └── ClipboardViewModel.swift # Business logic
└── Views/
    ├── ContentView.swift       # Main screen
    ├── AddEditView.swift       # Create/Edit screen
    ├── EmptyStateView.swift    # Empty list state
    └── Components/
        ├── ClipItemRow.swift   # List item component
        ├── SearchBar.swift     # Search component
        └── CategoryChip.swift  # Category chip
```
## 🔧 Key Components
- ClipItem — SwiftData model for clip storage
- ClipboardViewModel — State management and business logic
- ContentView — Root view with navigation
- ClipItemRow — Reusable list item component

## 🚀 Getting Started
- Clone or download the repository

- Open in Xcode 15.0+

- Build and run on iOS 17.0+ simulator or device

- Start saving and organizing your text snippets

## 💡 How to Use
- Add New Clip: Tap "+" to create new text snippets

- Organize: Assign categories for better organization

- Search: Use the search bar to quickly find clips

- Copy: Single tap to copy any clip to clipboard

- Edit: Long press or swipe to modify/delete clips

### 📄 License
This project is available for educational and personal use. The code can be modified and extended for learning purposes.
