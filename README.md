# Aletha Health Exercise App

A simple mobile exercise app built with Flutter and Bloc for Aletha Health. It helps users follow and complete exercises conveniently, promoting physical wellbeing by reducing pain and tightness.

## 🚀 Features

- Fetches exercises from a REST API
- Displays exercise name, duration, description, and difficulty
- Start timer for the duration of an exercise
- Marks exercises as completed upon finishing
- Completed exercises are shown with a green badge
- Clean and responsive UI
- Error handling with user-friendly messages
- Organized and maintainable codebase using Bloc for state management

## 🧱 Architecture

This app follows a basic layered architecture:

- **Models**: Represent data objects (`Exercise`)
- **Repository**: Handles API requests (`ExerciseRepository`)
- **Bloc**: Manages app state (`ExerciseBloc`, `ExerciseEvent`, `ExerciseState`)
- **UI**: Contains screens and widgets (`HomeScreen`, `DetailScreen`, `ExerciseTile`)
- **Routing**: Uses simple `Navigator.push` for navigation

## 📱 Screens

- **Home Screen**: Shows pending and completed exercises
- **Detail Screen**: Displays detailed information about an exercise and includes a Start button
- **Timer Screen** *(if added)*: Runs a timer for the exercise duration

## ⚠️ Known Shortcomings

- Completion status is currently stored only in memory and is reset when the app is restarted
- UI could be enhanced using Figma-based design
- No persistent streak/progress tracker yet (planned as optional feature)

## 🛠️ How to Run the App
 1. **Clone the Repository**
   ```bash
    git clone https://github.com/kuldi0305/aletha_health.git
   cd aletha_health_app
 - open the project in VS Code or Android Studio
 - Make sure you have flutter SDK version 3.24.5 • channel stable and Dart Version 3.5.4 installed
 - **Install Dependencies**: flutter pub get
 - **Run the app**: flutter run
 
## Dependencies
 - flutter_bloc
 - http
 
## AI Usage
 - **Model Used**: ChatGPR (GPT4)
 - **Purpose**: Helped with code refractoring and completed exercises feature.
 

## Dev Contact
 - **Name**: Kuldeep Nalawade
 - **Email**: knalwade77@gmail.com







