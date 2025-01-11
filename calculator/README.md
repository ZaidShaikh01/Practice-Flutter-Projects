# Flutter Calculator App

A simple, visually appealing calculator app built using Flutter. This app allows users to perform basic arithmetic operations such as addition, subtraction, multiplication, division, and more. It also includes functionality to calculate percentages and supports decimal numbers.

---

## Features

- Responsive and intuitive user interface.
- Clear (`C`) and delete (`DEL`) buttons for enhanced usability.
- Supports basic arithmetic operations:
  - Addition (`+`)
  - Subtraction (`-`)
  - Multiplication (`x`)
  - Division (`/`)
  - Modulus (`%`)
- Dynamic question and answer display.
- Styled buttons for numbers, operators, and special functions.
- Supports decimal inputs for precise calculations.

---

## Dependencies

### `math_expressions`
Version: `^2.6.0`

This app uses the `math_expressions` package for parsing and evaluating mathematical expressions. The package simplifies the logic of interpreting user input (e.g., `2+2` or `3*5/2`) and efficiently computes the result.

**Why use `math_expressions`?**
- It allows for the easy construction of mathematical expressions.
- Supports operations like addition, subtraction, multiplication, and division.
- Ensures accuracy and reliability in computations.

To add the dependency to your project, include the following in your `pubspec.yaml` file:
```yaml
dependencies:
  math_expressions: ^2.6.0
```
Learn more about the package [here](https://pub.dev/packages/math_expressions).
---
# Getting Started
Follow these steps to run the app on your local machine:

## Prerequisites
-  Install Flutter on your system.
- Ensure you have a connected device or emulator to run the app.
## Installation
1. Clone the repository:
```bash
git clone <repository-url>
```
2. Navigate to the project directory:
```bash
cd calculator
```
3. Fetch the dependencies:
```bash
flutter pub get
```
Run the app:
```bash
flutter run
```
# How It Works
- The GridView widget displays calculator buttons dynamically.
- math_expressions evaluates the user input string (e.g., 9+5/3) when the = button is pressed.
- Colors and text styles enhance the user experience.
---
# Screenshots
![Screenshot_1736603981](https://github.com/user-attachments/assets/ef0cb704-1d10-4556-b314-ac767da72996)
![Screenshot_1736603740](https://github.com/user-attachments/assets/276d4c1c-a2cf-454d-b43b-5288af52ef56)

## License
This project is licensed under the MIT License - see the LICENSE file for details.

Contributions
Feel free to fork this repository and submit pull requests. Contributions are always welcome!
