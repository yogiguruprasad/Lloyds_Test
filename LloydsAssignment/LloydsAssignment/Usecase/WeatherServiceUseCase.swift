//
//  WeatherService.swift
//  LloydsAssignment
//
//  Created by Gudluri GuruPrasad on 19/08/24.
//

import Foundation

protocol WeatherServiceable {
    func getTopRated(city: String) async -> Result<WeatherData, RequestError>
}

struct WeatherService: HTTPClient, WeatherServiceable {
    func getTopRated(city: String) async -> Result<WeatherData, RequestError> {
        return await sendRequest(endpoint: WeatherEndPoint.foreCast(city: city), responseModel: WeatherData.self)
    }
    
}
