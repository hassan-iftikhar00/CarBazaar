# CarBazaar

CarBazaar is a mobile application developed using Flutter that allows users to buy and sell cars. The app provides a seamless experience for browsing car listings, viewing detailed information about cars, and contacting sellers. It also includes features for managing user accounts, viewing fuel prices, and exploring various car-related services.

## Features

### Home Page
- **Welcome Banner**: Displays a personalized welcome message for logged-in users.
- **Search Bar**: Allows users to search for used cars.
- **Browse Options**: Users can browse cars by categories, budget, brand, model, and cities.
- **Certified Cars**: Displays a list of certified cars with detailed information.
- **Japanese Cars**: Showcases a selection of Japanese cars.
- **Electric Cars**: Highlights electric cars available for sale.
- **Current Fuel Prices**: Provides up-to-date fuel prices.

### Ad Details Page
- **Image Carousel**: Displays multiple images of the car in a carousel format.
- **Car Information**: Shows detailed information about the car, including price, city, year, mileage, fuel type, and gear type.
- **Vehicle Details**: Lists additional details such as registration, exterior color, assembly, engine capacity, body type, and ad ID.
- **Seller Comments**: Displays comments from the seller.
- **Features**: Lists the features of the car.
- **Seller Information**: Provides information about the seller, including name and membership details.
- **Action Buttons**: Allows users to call or chat with the seller.
- **Similar Listings**: Displays similar car listings that users may be interested in.

### Login Page
- **User Authentication**: Allows users to log in to their accounts.
- **Sign Up**: Provides an option for new users to sign up.
- **Login Prompt**: Redirects users to the login page if they try to access restricted features without being logged in.

### Ads Page
- **My Ads**: Displays the user's ads.
- **Add More Ads**: Allows users to add more ads by navigating to the Sell Now page.

### Sell Now Page
- **Car Details**: Users can enter details about the car they want to sell.
- **Seller Contact Info**: Users can provide their contact information.
- **Post Ad**: Allows users to post their ad.

### Chat Page
- **Chat List**: Displays a list of chats with other users.
- **Search Chats**: Allows users to search for specific chats.
- **Chat Detail**: Provides a detailed view of the chat with a specific user.

### More Page
- **Personal**: Includes options like My Activity, My Credits, Alerts, Notifications, Theme, and Choose Language.
- **Products**: Provides options for selling and buying cars, ordering car inspections, and accessing auto services.
- **Explore**: Includes options like Blog, Videos, and Cool Rides.
- **Login/Logout**: Allows users to log in or log out of their accounts.

## Backend Aspects

### User Authentication
- **Login**: Users can log in using their email and password.
- **Registration**: New users can sign up by providing their name, email, and password.
- **Token Management**: JWT tokens are used for managing user sessions.

### Ad Management
- **Create Ad**: Users can create new ads by providing car details and contact information.
- **View Ads**: Users can view a list of ads, including certified cars, Japanese cars, and electric cars.
- **Ad Details**: Detailed information about each ad is available, including images, price, and seller information.

### Chat Management
- **Chat List**: Users can view a list of chats with other users.
- **Chat Detail**: Users can view detailed chat history with a specific user.

### Fuel Prices
- **Current Fuel Prices**: The app provides up-to-date fuel prices for various types of fuel.

## Tech Stack

### Frontend
- **Flutter**: Used for building the mobile application.
- **Provider**: State management for managing user authentication and app state.

### Backend
- **Node.js**: Server-side runtime environment.
- **Express.js**: Web framework for building the API.
- **MongoDB**: NoSQL database for storing user and ad data.
- **JWT**: JSON Web Tokens for managing user authentication and sessions.

## Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/yourusername/CarBazaar.git
    ```

2. **Navigate to the project directory**:
    ```sh
    cd CarBazaar
    ```

3. **Install dependencies**:
    ```sh
    flutter pub get
    ```

4. **Run the app**:
    ```sh
    flutter run
    ```



This project is licensed under the MIT License.
