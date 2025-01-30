# 📚 Quiz App 🎯

A Flutter-based Quiz App that fetches questions from an API, presents multiple-choice questions, and displays a detailed summary upon completion.

## 🚀 Features

- ✅ Fetch quiz data dynamically from an API
- ✅ Multiple-choice questions with a user-friendly UI
- ✅ Score calculation with a result summary
- ✅ Responsive design for all screen sizes
- ✅ Clean, maintainable, and well-documented code

## 🛠️ Setup Instructions

1. Clone this repository.
   ```bash
   git clone https://github.com/yourusername/quiz-app.git
   ```
2. Install Dependencies
   ```bash
   flutter pub get
   ```
3. Set up API : add it in **lib/services/api_service.dart**
4. Run the App
   ```bash
   flutter run
   ```

## 📸 Screenshots   

<br>
<img src="https://github.com/user-attachments/assets/19b6e4a8-bb25-4385-9dad-a6e7741f060d " width="300" > <img src="https://github.com/user-attachments/assets/e9e69502-b4df-442a-97fe-0b2b4b17f7bb" width="300" > <img src="https://github.com/user-attachments/assets/de87d454-8349-4412-9ea3-f5d973220522" width="300" >
<img src="https://github.com/user-attachments/assets/97f09a70-0b07-4105-ace7-c07e10b3eeee" width="300" > <img src="https://github.com/user-attachments/assets/813d9856-ba16-4068-9760-f4d4dba46b52" width="300" > <img src="https://github.com/user-attachments/assets/48722bd9-7239-4f01-81a3-d296e23a9f4b" width="300" >

## 🎥 Video Demo


https://github.com/user-attachments/assets/b7d948ca-df27-41fb-be93-785c08ebc061


## 📂 Project Structure
```css
📦 quiz-app
┣ 📂 lib
┃ ┣ 📂 api_services
┃ ┃ ┣ 📜 api_services.dart
┃ ┣ 📂 components
┃ ┃ ┣ 📜 answer_button.dart
┃ ┃ ┣ 📜 identifier.dart
┃ ┃ ┣ 📜 start_button.dart
┃ ┃ ┣ 📜 summary.dart
┃ ┃ ┣ 📜 summary_item.dart
┃ ┣ 📂 controller   
┃ ┃ ┣ 📜 quiz_controller.dart
┃ ┣ 📂 model
┃ ┃ ┣ 📜 quiz_model.dart
┃ ┣ 📂 views
┃ ┃ ┣ 📜 questions.dart
┃ ┃ ┣ 📜 result_screen.dart
┃ ┃ ┣ 📜 splash_screen.dart
┃ ┃ ┣ 📜 start_screen.dart
┃ ┣ 📜 main.dart
┣ 📜 pubspec.yaml
┣ 📜 README.md
```

## 🛠️ Technologies Used
- Flutter (Dart) for UI
- Dio Package for API requests
- GetX for state management
- env for storing apiUrl
     














