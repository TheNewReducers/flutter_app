# CarbonDiet - Grocery Receipt Scanner
CarbonDiet is a mobile application that uses image recognition and AI technology to scan grocery shopping receipts, allowing users to calculate their carbon footprint. It was submitted to the [Google Challange](https://github.com/START-Hack/GOOGLE_STARTHACK23) of the [START](https://www.startglobal.org/) Hack 2023.

CarbonDiet provides users with a comprehensive summary of the environmental impact of their purchases and identifies the product categories that contribute the most to their carbon footprint. This information enables users to make more informed purchasing decisions in the future. The application calls a Python backend, which can be found at [GitHub](https://github.com/TheNewReducers/backend). The backend provides the necessary logic to recognize and classify items on the receipts and to calculate the carbon footprint of the user's shopping.

## Preview
![Screenshot_20230330-174608](https://user-images.githubusercontent.com/94179814/228897307-51de1f14-906e-4d7c-b9bc-b88b26914228.jpg)
![Screenshot_20230330-175049](https://user-images.githubusercontent.com/94179814/228897530-3e4c0974-4a85-4627-af22-6b9ca311b2d3.jpg)
![Screenshot_20230330-175407](https://user-images.githubusercontent.com/94179814/228897378-463634fa-c723-42c9-b55a-620a0ffe23a1.jpg)
![Screenshot_20230330-175412](https://user-images.githubusercontent.com/94179814/228897414-a90d2b5e-a9d0-471a-974a-ee34d135bfc6.jpg)


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
