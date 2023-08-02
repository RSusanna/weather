//
//  NetworkWeatherManager.swift
//  weather
//
//  Created by Susanna R on 30.07.2023.
//

import Foundation

struct NetworkWeatherManager {
    
    func fetchCurrentWeather(forCity city: String  ) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        //чтобы работать с сетевыми запросами нужно создать сессию
        let session = URLSession(configuration: .default)
        // это комплишн хендлер (обрабатывает ошибки) data -  данные response - ответ сервера и error -ошибка
        let task = session.dataTask(with: url) { data, response, error in
            //если данные есть:
            if let data = data {
                self.parseJSON(withData: data)
                //                // ютф8 - стандартная кодировка
                //                let dataString = String(data: data, encoding: .utf8)
                //                print(dataString!)
            }
        }
        task.resume()
    }
    //функция для парсинга
    func parseJSON(withData data: Data){
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            print(currentWeatherData.main.temp)
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
