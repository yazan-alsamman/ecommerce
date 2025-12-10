# Setup Guide - Complete Installation Instructions

This guide provides step-by-step instructions for setting up the Tataboq E-Commerce application on your local development environment.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Firebase Configuration](#firebase-configuration)
3. [Backend Server Setup](#backend-server-setup)
4. [Local Development Setup](#local-development-setup)
5. [Platform-Specific Configuration](#platform-specific-configuration)
6. [Troubleshooting](#troubleshooting)

## Prerequisites

Before starting, ensure you have completed the following:

- ✅ Flutter SDK installed (version 3.2.6 or higher)
- ✅ Dart SDK (included with Flutter)
- ✅ Android Studio or VS Code with Flutter extensions
- ✅ Git installed and configured
- ✅ Firebase account created
- ✅ Backend server URL available

### Verify Flutter Installation

```bash
flutter doctor
```

This command will check your Flutter installation and display any missing dependencies.

## Firebase Configuration

Firebase is used for authentication, cloud messaging, and cloud storage. Follow these steps to configure Firebase for your project.

### Step 1: Create Firebase Project

1. Navigate to [Firebase Console](https://console.firebase.google.com/)
2. Click "Add project" or select an existing project
3. Enter project name: `Tataboq E-Commerce` (or your preferred name)
4. Follow the setup wizard to create the project

### Step 2: Configure Android App

1. In Firebase Console, click the Android icon to add an Android app
2. Enter the following details:
   - **Package name**: `com.example.tataboq_app`
   - **App nickname**: `Tataboq Android` (optional)
   - **Debug signing certificate SHA-1**: (optional, for Google Sign-In)
3. Click "Register app"
4. Download the `google-services.json` file
5. Place the file in: `android/app/google-services.json`

#### Verify Android Configuration

Open `android/app/build.gradle` and ensure the following is present:

```gradle
dependencies {
    // ... other dependencies
    implementation platform('com.google.firebase:firebase-bom:32.0.0')
    implementation 'com.google.firebase:firebase-analytics'
    implementation 'com.google.firebase:firebase-messaging'
}
```

Also verify that `android/build.gradle` includes:

```gradle
dependencies {
    classpath 'com.google.gms:google-services:4.4.0'
}
```

### Step 3: Configure iOS App

1. In the same Firebase project, click the iOS icon to add an iOS app
2. Enter the following details:
   - **Bundle ID**: `com.example.tataboqApp`
   - **App nickname**: `Tataboq iOS` (optional)
   - **App Store ID**: (optional)
3. Click "Register app"
4. Download the `GoogleService-Info.plist` file
5. Open Xcode and add the file to `ios/Runner/` directory
   - Right-click `Runner` folder → "Add Files to Runner"
   - Select `GoogleService-Info.plist`
   - Ensure "Copy items if needed" is checked

#### Verify iOS Configuration

Open `ios/Runner/Info.plist` and ensure Firebase is properly configured. The `GoogleService-Info.plist` should be automatically linked.

### Step 4: Enable Firebase Services

In Firebase Console, enable the following services:

1. **Authentication**
   - Go to Authentication → Sign-in method
   - Enable Email/Password
   - Enable Google Sign-In (if using)

2. **Cloud Messaging**
   - Go to Cloud Messaging
   - Ensure it's enabled (default)

3. **Cloud Firestore**
   - Go to Firestore Database
   - Create database (start in test mode for development)
   - Set up security rules for production

## Backend Server Setup

The application requires a backend API server. Configure the server URL in the application.

### Step 1: Update Server Configuration

Open `lib/linkapi.dart` and update the server URL:

```dart
class AppLink {
  // Replace with your backend server URL
  static const String server = "https://your-backend-server.com/api";
  
  // For local development:
  // static const String server = "http://localhost:8081/ecommerce";
  // static const String server = "http://192.168.1.100:8081/ecommerce";
}
```

### Step 2: Verify API Endpoints

Ensure your backend server implements the following endpoints:

- **Authentication**
  - `POST /auth/signup.php` - User registration
  - `POST /auth/login.php` - User login
  - `POST /auth/verifycode.php` - Email verification
  - `POST /auth/resend.php` - Resend verification code

- **Password Recovery**
  - `POST /forgetpassword/checkemail.php` - Check email
  - `POST /forgetpassword/verifycode.php` - Verify reset code
  - `POST /forgetpassword/resetpassword.php` - Reset password

- **Products & Categories**
  - `GET /home.php` - Homepage data
  - `GET /items/items.php` - Product listings
  - `GET /items/sales.php` - Sale items
  - `GET /items/search.php` - Search products

- **Cart Operations**
  - `GET /cart/view.php` - View cart
  - `POST /cart/add.php` - Add to cart
  - `POST /cart/delete.php` - Remove from cart
  - `GET /cart/getcountitems.php` - Get cart count

- **Favorites**
  - `GET /favorite/view.php` - View favorites
  - `POST /favorite/add.php` - Add to favorites
  - `POST /favorite/remove.php` - Remove from favorites

- **Addresses**
  - `GET /adress/view.php` - View addresses
  - `POST /adress/add.php` - Add address
  - `POST /adress/edit.php` - Edit address
  - `POST /adress/delete.php` - Delete address

- **Orders**
  - `POST /orders/add.php` - Create order
  - `GET /orders/pending.php` - Pending orders
  - `GET /orders/archived.php` - Archived orders
  - `GET /orders/details.php` - Order details

### Step 3: CORS Configuration (for Web)

If testing on web, ensure your backend server allows CORS requests from your Flutter app origin.

## Local Development Setup

### Step 1: Clone and Install

```bash
# Clone the repository
git clone https://github.com/yazan-alsamman/ecommerce.git
cd ecommerce

# Install dependencies
flutter pub get
```

### Step 2: Configure Environment

1. Copy the example Firebase configuration file:
   ```bash
   # For Android
   cp android/app/google-services.json.example android/app/google-services.json
   # Then replace with your actual Firebase configuration
   ```

2. Update server URL in `lib/linkapi.dart`

### Step 3: Run the Application

```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Run in debug mode (default)
flutter run

# Run in release mode
flutter run --release
```

## Platform-Specific Configuration

### Android Configuration

#### Minimum SDK Version

Ensure `android/app/build.gradle` specifies:

```gradle
android {
    defaultConfig {
        minSdkVersion 21
        targetSdkVersion 33
    }
}
```

#### Permissions

Verify `android/app/src/main/AndroidManifest.xml` includes:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
```

### iOS Configuration

#### Minimum iOS Version

Ensure `ios/Podfile` specifies:

```ruby
platform :ios, '12.0'
```

#### Permissions

Verify `ios/Runner/Info.plist` includes:

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>We need your location to show nearby stores and delivery options</string>
<key>NSLocationAlwaysUsageDescription</key>
<string>We need your location for delivery tracking</string>
```

## Troubleshooting

### Common Issues

#### 1. Firebase Configuration Not Found

**Error**: `FileNotFoundException: google-services.json`

**Solution**:
- Ensure `google-services.json` exists in `android/app/`
- Verify file name is exactly `google-services.json` (case-sensitive)
- Run `flutter clean` and `flutter pub get`

#### 2. Build Errors

**Error**: Gradle build fails

**Solution**:
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
flutter run
```

#### 3. iOS Pod Installation Issues

**Error**: CocoaPods installation fails

**Solution**:
```bash
cd ios
pod deintegrate
pod install
cd ..
flutter clean
flutter pub get
```

#### 4. API Connection Errors

**Error**: Network request failed

**Solution**:
- Verify server URL in `lib/linkapi.dart`
- Check backend server is running
- Verify network connectivity
- Check CORS settings (for web)

#### 5. Location Permissions

**Error**: Location services not working

**Solution**:
- Verify permissions in `AndroidManifest.xml` / `Info.plist`
- Request permissions at runtime
- Check device location services are enabled

### Getting Help

If you encounter issues not covered here:

1. Check [Flutter Documentation](https://flutter.dev/docs)
2. Review [Firebase Documentation](https://firebase.google.com/docs)
3. Open an issue on GitHub
4. Check existing issues for similar problems

## Security Best Practices

### Development

- ⚠️ Never commit `google-services.json` or `GoogleService-Info.plist` to version control
- ⚠️ Use environment variables for sensitive configuration
- ⚠️ Keep signing keys secure and backed up
- ⚠️ Use test Firebase projects for development

### Production

- ✅ Use production Firebase project
- ✅ Implement proper API authentication
- ✅ Enable Firebase security rules
- ✅ Use HTTPS for all API calls
- ✅ Implement proper error handling
- ✅ Regular security audits

## Next Steps

After completing the setup:

1. ✅ Run the app and verify all features work
2. ✅ Test authentication flow
3. ✅ Test API connectivity
4. ✅ Verify push notifications
5. ✅ Test on both Android and iOS devices
6. ✅ Review and update security settings

---

**Need Help?** Refer to the main [README.md](README.md) or open an issue on GitHub.
