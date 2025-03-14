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
- Android Studio / VS Code
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
     http: ^1.3.0  # For API requests
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

## Assumptions Made

- Internet connectivity is required for the application to function properly
- The API endpoint is stable and returns data in the expected format
- The API doesn't require authentication for accessing data



## Screenshots

### Home Screen
![Home Screen](/screenshots/page1.jpg)
*Welcome screen with gradient background and app information*

### API Data Screen
![API Data Screen](/screenshots/page2.jpg)
*Screen displaying fetched data in a card-based list view*

### Error Handling
![Error Screen](/screenshots/internet_error.jpg)
*Error handling UI when network issues occur*

![Error Screen](/screenshots/api_error.jpg)
*Error handling UI when api issues occur*

### Loading State
![Loading Screen](/screenshots/loading_screen.jpg)
*Loading indicator while data is being fetched*


## Credits

Developed by: Nimal Prince