//
//  City.swift
//  Weather-demo
//
//  Created by Sanghun Park on 2022/02/24.
//

import Foundation

//{
//  "city_name":"서울",
//  "state":12,
//  "celsius":17.8,
//  "rainfall_probability":60
//},

struct City: Codable {
    
    let cityName: String
    let state: Int
    let celsius: Double
    let rainfallProbability: Int
    
    enum CodingKeys: String, CodingKey {
        case state, celsius
        case cityName = "city_name"
        case rainfallProbability = "rainfall_probability"
    }
    
    var fahrenheit: Double {
        let input = self.celsius * 9/5 + 32
        return round(input * 10) / 10
    }
    
    var stateImage: String {
        switch self.state {
        case 10:
            return "sunny"
        case 11:
            return "cloudy"
        case 12:
            return "rainy"
        case 13:
            return "snowy"
        default:
            return "sunny"
        }
    }
}
