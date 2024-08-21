//
//  WeatherViewModel.swift
//  LloydsAssignment
//
//  Created by Gudluri GuruPrasad on 19/08/24.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherData)
}

class WeatherViewModel {
    let service: WeatherServiceable
    var delegate: WeatherManagerDelegate?

    init(service: WeatherServiceable = WeatherService()) {
        self.service = service
        getWeatherReport(cityName: "Hyderabad")
    }
    
    func getWeatherReport(cityName: String) {
        Task(priority: .background) {
            let result = await service.getTopRated(city: cityName)
          switch result {
          case .success(let weather):
              self.delegate?.didUpdateWeather(weather: weather)
              print(weather.location.name)
          case .failure(let error):
              print(error.localizedDescription)
          }
        }
    }
}

