# stml_careconnect

CareConnect (STML CareConnect)

CareConnect is a mobile app prototype built with **Flutter** as part of an early implementation for the STML assignment.  
It includes a navigation spine and screen placeholders as a foundation for team development.

Overview

This project demonstrates:

- A Flutter mobile app structure  
- Basic screen layouts (Welcome, Login)  
- Navigation between screens  
- Light and dark theme support  
- Placeholder UI with clean starting point for additional screens

## Week 4 Scope

- Core screens: Welcome, Login, Dashboard, Tasks, Task Details, Calendar, Messages, Profile, Notifications
- Welcome/Login are complete; the remaining screens are in progress by the team
- Navigation spine: Welcome -> Login -> Dashboard

## Adding Your Screen

- Place your screen in `lib/screens`
- Register it in `lib/main.dart` if you need a new route
- Do not change route names in `lib/app/app_routes.dart`

## Testing

- Minimum: 1 widget test per screen
- Run all tests:

```bash
flutter test
```

- PowerShell coverage:

```powershell
.\scripts\coverage.ps1
```

## Sunday Demo Flow

- Welcome -> Get Started -> Login -> Sign In -> Dashboard placeholder
- Mention tests and the coverage command

## Getting Started

### Prerequisites

Make sure you have the following installed:

- Flutter SDK  
- Git  
- An Android emulator or iOS simulator (or a real device)

---

### Run Locally

1. Clone the repository:

```bash
git clone https://github.com/umgcTeam10/careconnect2026.git
```

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

4. Run tests:

```bash
flutter test
```
