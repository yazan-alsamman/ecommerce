# Tataboq E-Commerce App

A modern, feature-rich e-commerce mobile application built with Flutter, providing a seamless shopping experience across Android and iOS platforms.

## 📱 Overview

Tataboq is a comprehensive e-commerce solution that enables users to browse products, manage shopping carts, track orders, and enjoy a smooth purchasing experience. The application follows clean architecture principles and implements best practices for mobile app development.

## ✨ Features

### Core Functionality
- 🔐 **User Authentication** - Secure signup, login, and password recovery with email verification
- 🛒 **Shopping Cart** - Add, remove, and manage items with real-time updates
- ❤️ **Favorites** - Save and manage favorite products
- 📍 **Address Management** - Add, edit, and manage multiple delivery addresses with map integration
- 🔔 **Push Notifications** - Real-time notifications for orders and updates using Firebase Cloud Messaging
- 🗺️ **Location Services** - Interactive map for address selection using OpenStreetMap
- 🔍 **Product Search** - Advanced search functionality with filters
- 💳 **Checkout & Payment** - Complete checkout flow with multiple payment methods
- 📦 **Order Management** - Track pending and archived orders with detailed status
- 🎁 **Offers & Coupons** - Apply discount codes and view special offers
- 🌐 **Multi-language Support** - Localization support for multiple languages
- 📱 **Responsive Design** - Optimized UI for various screen sizes

### Technical Features
- **State Management** - GetX for reactive state management
- **API Integration** - RESTful API communication with backend services
- **Local Storage** - SQLite for offline data persistence
- **Image Caching** - Efficient image loading and caching
- **Error Handling** - Comprehensive error handling and user feedback
- **Loading States** - Smooth loading indicators and skeleton screens

## 🛠️ Tech Stack

- **Framework**: Flutter 3.2.6+
- **Language**: Dart
- **State Management**: GetX
- **Backend**: RESTful API (PHP)
- **Database**: SQLite (local), Cloud Firestore (cloud)
- **Maps**: flutter_map with OpenStreetMap
- **Notifications**: Firebase Cloud Messaging
- **Authentication**: Firebase Authentication, Google Sign-In
- **Image Handling**: cached_network_image
- **HTTP Client**: http package

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (>=3.2.6) - [Install Flutter](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (comes with Flutter)
- **Android Studio** or **VS Code** with Flutter extensions
- **Android SDK** (for Android development)
- **Xcode** (for iOS development, macOS only)
- **Firebase Account** - [Create Firebase Project](https://console.firebase.google.com/)
- **Git** - For version control

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yazan-alsamman/ecommerce.git
cd ecommerce
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Configure Firebase

#### For Android:
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Create a new project or select an existing one
3. Add an Android app to your project
4. Enter package name: `com.example.tataboq_app`
5. Download `google-services.json`
6. Place the file in `android/app/google-services.json`

#### For iOS:
1. In the same Firebase project, add an iOS app
2. Enter Bundle ID: `com.example.tataboqApp`
3. Download `GoogleService-Info.plist`
4. Place the file in `ios/Runner/GoogleService-Info.plist`

> **Note**: See `SETUP.md` for detailed setup instructions.

### 4. Configure Backend Server

Update the server URL in `lib/linkapi.dart`:

```dart
static const String server = "YOUR_BACKEND_SERVER_URL";
```

### 5. Run the Application

```bash
# Run on connected device/emulator
flutter run

# Run in release mode
flutter run --release
```

## 📁 Project Structure

```
lib/
├── bindings/              # Controller bindings for dependency injection
│   └── initialbinding.dart
├── controller/           # Business logic and state management
│   ├── auth/            # Authentication controllers
│   ├── cart/            # Shopping cart controllers
│   ├── orders/          # Order management controllers
│   └── ...
├── core/                 # Core functionality and utilities
│   ├── class/           # Base classes and utilities
│   ├── constant/        # App constants (routes, themes, images)
│   ├── functions/       # Helper functions
│   ├── middleware/      # Route middleware
│   └── services/        # Core services
├── data/                 # Data layer
│   ├── datasource/      # Data sources (remote, local)
│   │   ├── remote/     # API data sources
│   │   └── local/       # Local database sources
│   └── model/           # Data models
├── view/                 # UI layer
│   ├── screen/          # Full-screen views
│   │   ├── auth/        # Authentication screens
│   │   ├── home/        # Home screens
│   │   ├── cart/        # Cart screens
│   │   └── ...
│   └── widget/          # Reusable UI components
│       ├── auth/        # Auth-related widgets
│       ├── cart/        # Cart-related widgets
│       └── ...
├── routes.dart          # Application routing configuration
├── linkapi.dart         # API endpoints configuration
└── main.dart            # Application entry point
```

## 🏗️ Building for Production

### Android

#### Build APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

#### Build App Bundle (for Play Store)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

### iOS

```bash
flutter build ios --release
```

Then open `ios/Runner.xcworkspace` in Xcode to archive and upload to App Store.

## 🔒 Security Considerations

### Files Never Commit to Repository

The following sensitive files are excluded from version control:

- ❌ `android/app/google-services.json` - Contains Firebase API keys
- ❌ `ios/Runner/GoogleService-Info.plist` - Contains Firebase API keys
- ❌ `android/local.properties` - Local SDK paths
- ❌ `android/key.properties` - Signing key configuration
- ❌ `*.keystore`, `*.jks` - Signing keystores
- ❌ `build/` - Build artifacts
- ❌ `.dart_tool/` - Dart tooling cache

### Best Practices

1. **Never commit sensitive files** - Use `.gitignore` properly
2. **Use environment variables** - For API keys in production
3. **Secure keystores** - Store signing keys in secure locations
4. **API security** - Implement proper authentication and authorization
5. **Data encryption** - Encrypt sensitive user data

## 🧪 Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/
```

## 📦 Dependencies

Key dependencies include:

- `get` - State management and routing
- `http` - HTTP client for API calls
- `firebase_core` & `firebase_messaging` - Firebase integration
- `cloud_firestore` - Cloud database
- `sqflite` - Local SQLite database
- `shared_preferences` - Key-value storage
- `geolocator` & `geocoding` - Location services
- `flutter_map` & `latlong2` - Map functionality
- `cached_network_image` - Image caching
- `google_sign_in` - Google authentication
- `flutter_local_notifications` - Local notifications

See `pubspec.yaml` for complete dependency list.

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit your changes** (`git commit -m 'Add some AmazingFeature'`)
4. **Push to the branch** (`git push origin feature/AmazingFeature`)
5. **Open a Pull Request**

### Code Style

- Follow Dart/Flutter style guidelines
- Write meaningful commit messages
- Add comments for complex logic
- Maintain consistent naming conventions

## 📄 License

This project is proprietary software. All rights reserved.

## 👥 Authors

- **Yazan Al-Samman** - Initial work

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- OpenStreetMap for map tiles
- All open-source contributors whose packages made this project possible

## 📞 Support

For support, please open an issue in the GitHub repository or contact the development team.

---

**Note**: This application requires a backend server to function properly. Ensure your backend API is configured and running before using the app.
