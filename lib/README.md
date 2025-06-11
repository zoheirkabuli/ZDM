# 📱 App Architecture Guide

This Flutter app follows the **MVVM (Model-View-ViewModel)** architecture pattern with **Clean Architecture** principles. This document explains how the code is organized and why.

## 🏗️ What is MVVM?

**MVVM** stands for:

- **Model**: Handles data (from APIs, databases, etc.)
- **View**: What users see (screens, buttons, etc.)
- **ViewModel**: Connects Model and View (business logic)

Think of it like a restaurant:

- **Model** = Kitchen (prepares the food/data)
- **View** = Dining area (where customers sit/what they see)
- **ViewModel** = Waiter (takes orders, brings food, handles communication)

## 📁 Folder Structure

```
lib/
├── main.dart              # App entry point
├── core/                  # Shared utilities
│   ├── utils/            # Helper functions
│   ├── errors/           # Error handling
│   └── enums/            # App constants
├── data/                  # Data Layer (Model)
│   ├── datasources/      # Where data comes from
│   │   ├── remote/       # API calls
│   │   └── local/        # Local storage
│   ├── models/           # Data structures
│   └── repositories/     # Data access logic
├── domain/                # Business Logic Layer
│   ├── usecases/         # What the app can do
│   └── repositories/     # Data contracts
├── presentation/          # UI Layer (View + ViewModel)
│   ├── screens/          # App pages
│   ├── widgets/          # Reusable UI components
│   └── viewmodels/       # Business logic for UI
└── services/             # External services
```

## 🔄 How It Works

### 1. **Data Layer** (`data/`)

- **What it does**: Gets data from APIs, databases, or files
- **Contains**:
  - `datasources/`: Actual data fetching code
  - `models/`: How data is structured
  - `repositories/`: Organizes data access

### 2. **Domain Layer** (`domain/`)

- **What it does**: Contains business rules and logic
- **Contains**:
  - `usecases/`: Specific actions the app can perform
  - `repositories/`: Contracts for data access

### 3. **Presentation Layer** (`presentation/`)

- **What it does**: Everything users see and interact with
- **Contains**:
  - `screens/`: Individual app pages
  - `widgets/`: Reusable UI components
  - `viewmodels/`: Logic that connects UI to data

### 4. **Core** (`core/`)

- **What it does**: Shared code used everywhere
- **Contains**: Utilities, error handling, constants

### 5. **Services** (`services/`)

- **What it does**: External integrations (notifications, analytics, etc.)

## 🎯 Benefits of This Architecture

1. **Easy to Test**: Each part can be tested separately
2. **Easy to Maintain**: Changes in one part don't break others
3. **Team Friendly**: Multiple developers can work on different parts
4. **Scalable**: Easy to add new features
5. **Clean Code**: Everything has its place

## 🚀 Getting Started

1. **Adding a new feature?** Start with the domain layer (what should it do?)
2. **Need data?** Add it to the data layer
3. **Building UI?** Work in the presentation layer
4. **Shared code?** Put it in core

## 📝 Example Flow

When a user taps a button:

1. **View** (screen) detects the tap
2. **ViewModel** processes the action
3. **UseCase** (domain) defines what should happen
4. **Repository** (data) gets/saves data
5. **ViewModel** updates the **View** with results

---

_This architecture keeps our code organized, testable, and maintainable! 🎉_
