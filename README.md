# FASE Flutter Application

This is the cross-platform mobile application for FASE (Facial Attendance Security Elevation), built with Flutter.

[Check out companion backend project.](https://github.com/thecodepapaya/fase-backend)

## Overview

The FASE app provides a mobile interface for students and faculty to manage their courses and attendance. The app is designed to be secure and easy to use, with a focus on automating the attendance process.

## Features

- **User Authentication**: Secure login for students and faculty using Google Sign-In, integrated with Firebase Authentication.
- **Course Management**:
  - **For Students**: View enrolled courses and mark attendance.
  - **For Faculty**: View, create, and manage courses.
- **Automated Attendance**: Students can mark their attendance with a single tap. The app verifies their location by checking their device's connection to the institute's Wi-Fi network.
- **Real-time Attendance Window**: A live timer shows the active attendance window for each course, ensuring students can only mark attendance during the specified time.
- **Attendance History**: View detailed attendance records for each course.
- **System Integrity Checks**: The app performs security checks to ensure the device is not rooted/jailbroken and that all necessary permissions are granted before allowing attendance marking.
- **Cross-Platform**: A single codebase for Android, iOS, and potentially other platforms.

## Project Structure

The project follows the principles of Clean Architecture, separating the codebase into distinct layers:

- `lib/app/`: Contains the presentation layer, including UI (pages and widgets) and state management.
- `lib/data/`: The data layer, responsible for data sources and repositories.
- `lib/domain/`: The core of the application, containing business logic (use cases and entities).
- `lib/device/`: Handles device-specific functionalities like accessing network info.

### State Management

The app uses `flutter_riverpod` for state management, providing a robust and scalable way to manage application state.

### Navigation

Navigation is handled by `auto_route`, a powerful routing package that helps in structuring the app's navigation flow and passing arguments between screens.

## Setup

1.  **Install Flutter:**
    - Make sure you have the Flutter SDK installed. Follow the official [Flutter documentation](https://flutter.dev/docs/get-started/install) for instructions.

2.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd app
    ```

3.  **Set up Firebase:**
    - This project is integrated with Firebase. You will need to create a Firebase project and add the necessary configuration files:
      - For Android: `app/android/app/google-services.json`
      - For iOS: `app/ios/Runner/GoogleService-Info.plist`

4.  **Get dependencies:**
    ```bash
    flutter pub get
    ```

5.  **Run the code generator:**
    - The project uses code generation for routing. Run the following command to generate the necessary files:
    ```bash
    flutter pub run build_runner build
    ```

6.  **Run the app:**
    ```bash
    flutter run
    ```

## Future Work

As per the original project plan, a Phase 2 was envisioned to improve location verification accuracy. This phase was not implemented but was planned to include:

- **BLE Mesh Network**: Using a Bluetooth Low Energy mesh network to cross-verify that students are within the physical classroom (e.g., within a 10-15m range). This would add another layer of security and accuracy to the attendance system.
