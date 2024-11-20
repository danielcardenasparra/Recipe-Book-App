# 📖 Recipe Book App

**Recipe Book App** is a beautifully designed Flutter application that lets users explore, save, and manage their favorite recipes. With a clean and intuitive interface, it enhances the user experience by providing seamless navigation and recipe details. Perfect for food enthusiasts who love to organize and discover recipes!

---

## 🌟 Features

- 🌍 **Localization Support**: Multilingual support for an inclusive user experience.
- 📋 **Favorites Management**: Easily save and view your favorite recipes.
- 🔍 **Detailed Recipe View**: Navigate effortlessly to view ingredients, instructions, and more.
- 🛠 **State Management**: Powered by `Provider` for efficient and scalable state management.
- 🌐 **API Integration**: Fetch recipes and manage data dynamically using HTTP.
- 🎨 **Responsive UI**: A sleek, responsive design optimized for all devices.

---

## 🚀 Getting Started

Follow these steps to get the app running on your local environment.

### Prerequisites

- Install Flutter SDK: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
- Install Dart SDK (usually included with Flutter).

## 🚀 Installation and Setup

Clone this repository and get started:

```bash
git clone https://github.com/danielcardenasparra/Recipe-Book-App.git
cd recipe-book-app
flutter pub get
flutter run ```

## 📂 Folder Structure

```plaintext
recipe-book-app/
├── lib/
│   ├── models/               # Data models (e.g., Recipe)
│   ├── providers/            # State management (e.g., RecipesProvider)
│   ├── screens/              # UI screens (e.g., FavoritesRecipes, RecipeDetail)
│   ├── widgets/              # Reusable widgets (e.g., favoriteRecipesCard)
│   └── main.dart             # Entry point of the application
├── assets/
│   └── images/               # Image assets for recipes
├── pubspec.yaml              # Project dependencies and assets configuration
└── README.md                 # Project documentation
