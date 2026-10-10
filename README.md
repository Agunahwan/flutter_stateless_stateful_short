# Flutter StatelessWidget vs StatefulWidget

A simple Flutter application demonstrating the difference between `StatelessWidget` and `StatefulWidget`.

## Project Overview

The app contains two examples:

- **GreetingWidget (`StatelessWidget`)** — displays a static greeting message: “Hello, Flutter!”
- **CounterWidget (`StatefulWidget`)** — displays a counter value that can be increased, decreased, or reset by pressing buttons.

The counter uses `setState()` to update its value and trigger a rebuild of the relevant UI.

## Project Structure

```text
flutter_stateless_stateful_short/
├── lib/
│   └── main.dart
├── pubspec.yaml
├── analysis_options.yaml
├── .gitignore
└── README.md
```

## Requirements

- Flutter SDK
- Dart SDK included with Flutter

## Run the Application

From the project root, run:

```bash
flutter create .
flutter pub get
flutter run
```

The `flutter create .` command generates the platform-specific project files required by your local Flutter SDK.

## Main Concepts

### StatelessWidget

A `StatelessWidget` does not own a mutable `State` object. It is suitable for UI that does not need to manage changing local state. Its widget tree can still be rebuilt when its configuration or parent changes.

### StatefulWidget

A `StatefulWidget` is used when a widget needs a `State` object that can change during the widget's lifetime.

### setState()

`setState()` notifies Flutter that the state has changed and schedules a rebuild so the UI can reflect the updated value.
