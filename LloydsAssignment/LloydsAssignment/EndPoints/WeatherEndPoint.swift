//
//  WeatherEndPoint.swift
//  LloydsAssignment
//
//  Created by Gudluri GuruPrasad on 19/08/24.
//

import Foundation

enum WeatherEndPoint {
    case foreCast(city: String)
}

extension WeatherEndPoint: Endpoint {
    var queryParams: [URLQueryItem]? {
        switch self {
        case .foreCast(let city):
            return [URLQueryItem(name: "access_key", value: API_KEY),
                    URLQueryItem(name: "query", value: city)]
        }
    }
    
    var path: String {
        switch self {
        case .foreCast:
            return "/forecast"
       
        }
    }

    var method: RequestMethod {
        switch self {
        case .foreCast:
            return .get
        }
    }

    var header: [String: String]? {
        // Access Token to use in Bearer header
        switch self {
        case .foreCast:
            return [:]
        }
    }
    
    var body: [String: String]? {
        switch self {
        case .foreCast:
            return nil
        }
    }
}
