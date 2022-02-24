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
}
