# ExploreShala
The app is developed in SwiftUI and MVVM architecture pattern is followed for code organization. 

This app is going to feature a list of top rated restaurants and sites to visit in the city that the user lives in. The data comes from the Yelp API and the app leverages MapKit to show maps and directions.
The app uses the CoreLocation framework to request permision to geolocate the user. 
Firebase authentication is implemeted in the app and Firestore database is used to keep track of the places visited by the user and a wishlist of the places that the user wants to visit. 

The main steps invloved in developing the app were:
  - Check if the user is logged in or not
  - If logged in, then fetch the wishlist and visited places data from Firestore
  - If not logged in, then show the user the sign-in/sign-up screen
  - Construct network requests and fetch data from the Yelp API
  - Parse the resulting JSON
  - Display map with tappable landmarks and show directions.

Once the app gets the user's location, it will display a list of popular restaurants and sights to visit near the user’s location. Upon drilling down into any of the restaurants or sights, the user gets the option to see directions to the corresponding place on a map with tappable landmarks. The user also gets the option to place a call using call button to the place’s reception/help desk. There are links in the app that can be visited to read the reviews about the place or to visit the restaurant's or sight's official website.  
