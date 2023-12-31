//
//  ViewController+alertController.swift
//  weather
//
//  Created by Susanna R on 30.07.2023.
//

import UIKit

extension ViewController {
//Логика для алерт контроллера
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping(String) -> Void) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField {
            tf in
            //на фоне текстхолдера рандомно будут эти города прописаны
            let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
            tf.placeholder = cities.randomElement()
        }
        //Создание кнопки search
        let search = UIAlertAction(title: "Search", style: .default) {
            action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else {
                return
            }
            if cityName != "" {
//                self.networkWeatherManager.fetchCurrentWeather(forCity: cityName)
                //загуглить что за %20
                let city = cityName.split(separator: "").joined(separator: "%20")
                completionHandler(city)
            }
        }
        //Если пользователь передумал искать
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}
