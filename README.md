# CarbonDiet - Grocery Receipt Scanner
CarbonDiet is a mobile application that uses image recognition and AI technology to scan grocery shopping receipts, allowing users to calculate their carbon footprint. It was submitted to the [Google Challange](https://github.com/START-Hack/GOOGLE_STARTHACK23) of the [START](https://www.startglobal.org/) Hack 2023.

CarbonDiet provides users with a comprehensive summary of the environmental impact of their purchases and identifies the product categories that contribute the most to their carbon footprint. This information enables users to make more informed purchasing decisions in the future. The application calls a Python backend, which can be found at [GitHub](https://github.com/TheNewReducers/backend). The backend provides the necessary logic to recognize and classify items on the receipts and to calculate the carbon footprint of the user's shopping.

## Features
- Scan grocery shopping receipts using the phone camera
- Get an overview of the user's carbon footprint based on their purchases
- Show identified product categories that contribute most to the user's carbon footprint
- Visualized feedback on how their shopping behavior and carbon footprint have changed over time

## Getting Started
### Prerequisites
- Flutter SDK
- Android Studio or Visual Studio Code with Flutter extensions installed
- A compatible Android or iOS device or an emulator

### Installation
1. Clone the repository: git clone https://github.com/TheNewReducers/flutter_app.git
2. Navigate to the project directory:`cd flutter_app`
3. Install dependencies: flutter pub get
4. Run the app: `flutter run`
