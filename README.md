# API Fetching Flutter Application

A simple Flutter application that demonstrates fetching and displaying data API. The application showcases proper API integration with error handling and a clean, responsive UI.

## Project Overview

This project demonstrates:
- Clean architecture with separate screen components
- API integration using the http package
- Error handling for network requests
- Responsive UI with Material Design elements
- Navigation between screens

## Features Implemented

1. **Home Screen**
   - Welcoming interface with gradient background
   - Information about the application and developer
   - Navigation to the API data page

2. **API Data Screen**
   - Fetches post data from JSONPlaceholder API
   - Displays data in a scrollable list using ListView with nicely formatted cards
   - Comprehensive error handling with user-friendly error messages
   - Refresh functionality to reload data
   - Loading indicators during data fetching

3. **UI/UX Features**
   - Consistent color scheme with brown as the primary color
   - Material Design 3 implementation
   - Responsive layout adaptable to different screen sizes
   - Elevated cards with shadows for better visual hierarchy
   - Clear typography with varying font sizes and weights

## Setup Instructions

### Prerequisites
- Flutter SDK (2.5.0 or higher)
- Dart SDK (2.14.0 or higher)
- Android Studio / VS Code with Flutter extensions
- A physical device or emulator for testing

### Installation Steps

1. **Clone the repository**
   ```
   git clone https://github.com/Nimal-dev/api_fetch_app.git
   cd api_fetch_app
   ```

2. **Install dependencies**
   ```
   flutter pub get
   ```

3. **Verify dependencies**
   Ensure the following dependencies are in your `pubspec.yaml`:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     http: ^[version]  # For API requests
   ```

4. **Run the application**
   ```
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart            # Application entry point
└── screens/
    ├── homePage.dart    # Welcome screen with navigation
    └── assignmentPage.dart  # API fetching and display screen
```

## Additional Enhancements (Future Work)

The following enhancements could be added to extend the functionality:

1. **State Management**
   - Implement a state management solution like Provider or Bloc for more complex applications

2. **Caching**
   - Add local storage to cache API responses for offline use

3. **Search and Filter**
   - Add functionality to search or filter the fetched data

4. **Pagination**
   - Implement pagination for more efficient loading of large datasets

5. **User Interactions**
   - Add functionality to interact with posts (like, comment, share)

6. **Authentication**
   - Add user authentication for personalized content

## Assumptions Made

- Internet connectivity is required for the application to function properly
- The API endpoint is stable and returns data in the expected format
- The application is designed for portrait mode on mobile devices
- The API doesn't require authentication for accessing data

## Credits

Developed by: Nimal Prince