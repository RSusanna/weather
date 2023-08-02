//
//  CurrentWeatherData.swift
//  weather
//
//  Created by Susanna R on 30.07.2023.
//

import Foundation

struct CurrentWeatherData: Codable  {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    //стандартное написание чтобы мы feels_like превратили в feelsLike
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
    }
}

struct Weather: Codable {
    let id: Int
}
