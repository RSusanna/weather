//
//  ViewController.swift
//  weather
//
//  Created by Susanna R on 30.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    //MARK: - Аутлеты
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    
    var networkWeatherManager = NetworkWeatherManager()
    
    
    @IBAction func searchPressed(_ sender: Any) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in self.networkWeatherManager.fetchCurrentWeather(forCity: city)}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
    }
}

