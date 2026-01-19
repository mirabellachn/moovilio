# Moovilio

Moovilio is a native iOS application that displays popular movies using data from **The Movie Database (TMDB)** API.  
The app focuses on clean architecture, native iOS UI/UX, and maintainable code.

---

## Features

- **Movie Discovery Grid**
  - Displays popular movies in a grid layout
  - Optimized for browsing and discoverability

- **Movie Detail Screen**
  - Shows movie poster, title, and overview
  - Displays YouTube trailer (if available)
  - Displays user reviews for the selected movie

- **Endless Scrolling**
  - Automatically loads more movies as the user scrolls

- **Error Handling**
  - Gracefully handles network errors
  - Retry option when data fetching fails

---

## Architecture

The app follows the **MVVM (Model–View–ViewModel)** architecture:

- **Model**: Represents TMDB API response data
- **View**: SwiftUI views responsible for UI rendering
- **ViewModel**: Handles business logic and state management

This separation improves readability, testability, and maintainability.

---

## Tech Stack

- **Language**: Swift 
- **UI Framework**: SwiftUI
- **Networking**: URLSession
- **Architecture Pattern**: MVVM
- **Concurrency**: Swift async/await
- **Testing**: XCTest (Unit Test)

---

## Testing

- Includes a basic unit test for the core `Movie` model
- Ensures the model initializes correctly and behaves predictably
- Tests are simple, fast, and deterministic

---

## UI / UX Considerations

- Native iOS look and feel
- Poster-focused grid layout for easy browsing
- Clean typography and spacing
- Supports Light Mode and Dark Mode
- Simple and intuitive navigation flow

---

## API

This project uses **The Movie Database (TMDB) API**, including:
- Popular movies endpoint
- Movie reviews endpoint
- Movie videos (YouTube trailers)

> A TMDB API key is required to run the project.

---

## Getting Started

1. Clone this repository
2. Open the project using the latest version of Xcode
3. Add your TMDB API key in `APIConfig.swift`
4. Build and run the app on an iOS simulator or device

---

## Notes

This project was created as a take-home assignment with emphasis on:
- Clean and readable code
- Practical architecture choices
- Native iOS development best practices

---

## 👤 Author

Mirabella  
iOS Developer
