# Task Management App

A Flutter-based cross-platform application for managing user profiles. The app allows users to add, update, and delete user profiles while fetching and caching data from an external API. It also includes custom themes, animations, and platform-specific UI enhancements.

---

## Features

### User Management

- **Add User**: Add new user profiles by providing details such as name, username, email, address, phone, website, and company information.
- **Update User**: Update existing user profiles with new information.
- **Delete User**: Delete user profiles with a confirmation dialog to prevent accidental deletions.

### Data Handling

- **Fetch User Data**: Fetch user data from an external API (`https://jsonplaceholder.typicode.com/users`) and store it locally using `shared_preferences`.
- **Cache User Data**: Cache user data locally to improve performance and enable offline access.

### UI Components

- **User List**: Display a list of all users with their usernames and profile pictures.
- **User Details**: Show detailed information about a selected user, including their name, email, address, phone, website, and company.
- **Team Members**: Display a list of team members with their names. A confetti animation is triggered when a team member's name is tapped.

### Styling and Theming

- **Custom Themes**: Use platform-specific themes (Android, iOS, macOS, Linux, Windows) to ensure a consistent look and feel across devices.
- **Launch Screen**: Custom launch screens for Android and iOS.

### Animations and Effects

- **Confetti Animation**: A fun confetti animation is displayed when interacting with team members.

### Form Validation

- **Input Fields**: Input fields for user details include validation to ensure data integrity.

### State Management

- **Stateful Widgets**: Manage the state of user data and loading indicators using stateful widgets.

### Networking

- **Dio Package**: Use the `Dio` package for making HTTP requests to fetch and update user data.

---

## App Demo Video 🎥

[Watch the localization demo video here](https://github.com/user-attachments/assets/2327b381-ab4b-4dd6-ac28-f30948df2c78)

## Screenshots

| Loading State                                                                                     | Users List                                                                                        | User Details      | Add User                                                                                     | Edit User                                                                                     | Team Members                                                                                     |
| ------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- | ----------------- | -------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| ![Loading State](https://github.com/user-attachments/assets/71d27473-7920-48c1-af29-5c265a569b59) | ![Employee List](https://github.com/user-attachments/assets/c318ac91-e2d2-478f-bf35-5781dbb53a1a) | ![User Details](https://github.com/user-attachments/assets/9bd59445-608f-4ccf-b9c8-2a86f072378c) | ![Add User](https://github.com/user-attachments/assets/c1d6aba9-2904-4e67-b1ca-b03a472eb791) | ![Edit User](https://github.com/user-attachments/assets/091ef416-8745-49fd-b743-6e0f27bc1f10) | ![Team Members](https://github.com/user-attachments/assets/bb0fa009-10e1-4448-b173-9cfdc687ccc7) |

---

## Getting Started

### Prerequisites

- Flutter SDK installed on your machine.
- An IDE (e.g., Android Studio, VS Code) with Flutter and Dart plugins installed.

### Installation

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/OmarAmeer96/Sprints-Data-Handling-Project.git
   cd Sprints-Data-Handling-Project
   ```

2. **Install Dependencies**:

   ```bash
   flutter pub get
   ```

3. **Run the App**:

   ```bash
   flutter run
   ```

---

## Dependencies

- [dio](https://pub.dev/packages/dio): A powerful HTTP client for making network requests.
- [shared_preferences](https://pub.dev/packages/shared_preferences): A Flutter plugin for reading and writing key-value pairs to device storage.
- [confetti](https://pub.dev/packages/confetti): A Flutter package for creating confetti animations.

---

## Teame Members

- Omar Ameer
- Ahmed Elnahrawy
- Hanan Ashraf
- Rania Mostafa
- Mazen Mounir
- Mohamed Adel
