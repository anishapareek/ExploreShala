# ExploreShala

This app is going to feature a list of top rated restaurants and sites to visit in the city that the user lives in. The data comes from the Yelp API and the app also leverages MapKit to show maps and directions.
The app also uses the CoreLocation framework to request permision to geolocate the user.

The main steps invloved in developing the app were:
  - Construct network requests and fetch data from the Yelp API
  - Parse the resulting JSON
  - Display map with tappable landmarks and show directions.

Once the app gets the user's location, it will display a list of popular restaurants and sights to visit near the user’s location. Upon drilling down into any of the restaurants or sights, the user gets the option to see directions to the corresponding place on a map with tappable landmarks. The user also gets the option to place a call using call button to the place’s reception/help desk. There are links in the app that can be visited to read the reviews about the place or to visit the restaurant's or sight's official website.  
