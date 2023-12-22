# restaurant_app

This is the Flutter base directory for my mobile app TastyTable. All of the code I wrote is contained in the lib folder. The lib folder contains the following items and subdirectories.
- `/lib/backend` contains all backend implementations for the application. Note that the backend implementation is client-side
- `/lib/page_assets` contains flutter-based frontend code that implements all the subcomponents of the user interface.
- `/lib/main.dart` is the main program for the application. it also contains the top-level frontend classes based on the Flutter framework.

## Getting Started
To install the app on windows, first install the Flutter SDK using the link and following the instructions. You will also need to add the SDK to to your `$env:path` environmental variable.

- https://docs.flutter.dev/get-started/install/windows

Then, clone the repository using the following command:

```git clone https://github.com/JTP75/restaurant_app.git```

To install the dependencies, navigate the the `restaurant_app/` directory and run:

```flutter pub get```

The app may now be run from the `restaurant_app/` directory using:

```flutter run -d windows```
