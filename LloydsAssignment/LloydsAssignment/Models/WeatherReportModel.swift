//
//  WeatherReportModel.swift
//  LloydsAssignment
//
//  Created by Gudluri GuruPrasad on 19/08/24.
//

import Foundation

struct WeatherData: Codable {
    let request: Request
    let location: Location
    let current: CurruntData
    //let forecast: [String: Any]
}

struct Request: Codable {
    let type: String
    let query: String
    let language: String
    let unit: String
}

struct Location: Codable {
    let name: String
    let country: String
    let region: String
    let lat: String
    let lon: String
    let timezone_id: String
    let localtime: String
    let localtime_epoch: Double
    let utc_offset: String
}

struct CurruntData: Codable {
    let observation_time: String
    let temperature: Int
    let weather_code: Int
    let weather_icons: [String]
    let weather_descriptions: [String]
    let wind_speed: Int
    let wind_degree: Int
    let wind_dir: String
    let pressure: Int
    let precip: Int
    let humidity: Int
    let cloudcover: Int
    let feelslike: Int
    let uv_index: Int
    let visibility: Int
    let is_day: String
}
