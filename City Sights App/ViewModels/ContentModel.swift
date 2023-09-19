//
//  ContentModel.swift
//  City Sights App
//
//  Created by Anisha Pareek on 8/25/23.
//

import Foundation
import CoreLocation

@MainActor
class ContentModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var restaurants = [Business]()
    @Published var sights = [Business]()
    var locationManager = CLLocationManager()
    
    override init() {
        
        // Init method of NSObject
        super.init()
        
        // Set content model as the delegate of the location manager
        locationManager.delegate = self
        
        // request permission from the user
        locationManager.requestWhenInUseAuthorization()
        
        // TODO: Start geolocating the user, after we get the permission
        //        locationManager.startUpdatingLocation()
    }
    
    // MARK: Location Manager Delegate Methods
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedAlways ||
            manager.authorizationStatus == .authorizedWhenInUse {
            // We have permission, start geolocating the user
            manager.startUpdatingLocation()
        }
        else if manager.authorizationStatus == .denied {
            // We don't have permission
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations.first
        if let userLocation {
            // Stop requesting the location after we get it once
            manager.stopUpdatingLocation()
            
            // If we have the coordinates of the user, send into Yelp API
            Task {
                await getBusinesses(category: Constants.sightsKey, location: userLocation)
                await getBusinesses(category: Constants.restaurantsKey, location: userLocation)
            }
        }
        // else continue getting the location of the user
    }
    
    // MARK: - Yelp API methods
    
    func getBusinesses(category: String, location: CLLocation) async {
        // 1. Create url
        
        /*let urlString = "https://api.yelp.com/v3/businesses/search?latitude=\(location.coordinate.latitude)&longitude=\(location.coordinate.longitude)&categories=\(category)&limit=6"
         let url = URL(string: urlString)
         */
        var urlComponents = URLComponents(string: Constants.apiUrl)
        urlComponents?.queryItems = [
            URLQueryItem(name: "latitude", value: String(location.coordinate.latitude)),
            URLQueryItem(name: "longitude", value: String(location.coordinate.longitude)),
            URLQueryItem(name: "categories", value: category),
            URLQueryItem(name: "limit", value: "6")
        ]
        let url = urlComponents?.url
        
        if let url {
            // 2. Create url request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"
            request.addValue("Bearer \(Constants.apiKey)", forHTTPHeaderField: "Authorization")
            
            // 3. Url session
            do {
                let (data, _) = try await URLSession.shared.data(for: request)
                // Parse json
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                switch category {
                case Constants.restaurantsKey:
                    self.restaurants = result.businesses
                case Constants.sightsKey:
                    self.sights = result.businesses
                default:
                    break
                }
            } catch {
                // could not fetch data
                print(error.localizedDescription)
            }
        }
    }
}
