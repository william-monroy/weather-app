//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by William Frank Monroy Mamani on 19/02/24.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody{
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid={API KEY}&units=metric") else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url:url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error fetching weather data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from:data)
        
//        print(decodedData)
        
        return decodedData
    }
}

struct ResponseBody: Decodable{
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var base:String
    var main: MainResponse
    var visibility:Int
    var wind: WindResponse
    var clouds: CloudsResponse
    var dt:Int
    var sys:SysResponse?
    var timezone:Int
    var id:Int
    var name:String
    var cod:Int
    
    struct CoordinatesResponse: Decodable {
        var lon:Double
        var lat:Double
    }
    
    struct WeatherResponse: Decodable {
        var id:Int
        var main:String
        var description:String
        var icon:String
    }
    
    struct MainResponse: Decodable {
        var temp:Double
        var feels_like:Double
        var temp_min:Double
        var temp_max:Double
        var pressure:Int
        var humidity:Double
    }
    
    struct WindResponse: Decodable {
        var speed:Double
        var deg:Int
    }
    
    struct CloudsResponse: Decodable{
        var all:Int
    }
    
    struct SysResponse: Decodable{
        let type: Int?
        let id: Int?
        let country: String?
        let sunrise: Double?
        let sunset: Double?
    }
}
