//
//  ViewController.swift
//  LloydsAssignment
//
//  Created by Gudluri GuruPrasad on 18/08/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    @IBOutlet weak var forecastImage1: UIImageView!
    @IBOutlet weak var forecastImage2: UIImageView!
    @IBOutlet weak var forecastImage3: UIImageView!
    @IBOutlet weak var forecastImage4: UIImageView!
    
    @IBOutlet weak var forecastTemp1: UILabel!
    @IBOutlet weak var forecastTemp2: UILabel!
    @IBOutlet weak var forecastTemp3: UILabel!
    @IBOutlet weak var forecastTemp4: UILabel!
    
    @IBOutlet weak var time1: UILabel!
    @IBOutlet weak var time2: UILabel!
    @IBOutlet weak var time3: UILabel!
    @IBOutlet weak var time4: UILabel!
    
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var sunriseTime: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    let viewModel = WeatherViewModel()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        searchTextField.delegate = self
        viewModel.delegate = self
    }


}

//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        if let city = searchTextField.text {
            viewModel.getWeatherReport(cityName: city)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       // searchTextField.text = ""
    }
}

//MARK: - CLLocationManagerDelegate


extension ViewController: CLLocationManagerDelegate {
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            //let lat = location.coordinate.latitude
            //let lon = location.coordinate.longitude
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

extension ViewController: WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherData) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.location.name
            self.temperatureLabel.text = weather.current.temperature.description
            self.feelsLikeLabel.text = ("\(String(format: "%.0f", weather.current.feelslike))°C")
            self.humidityLabel.text = "\(String(weather.current.humidity))%"
        }
        
    }
}
