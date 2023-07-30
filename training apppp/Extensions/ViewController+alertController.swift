//
//  ViewController+alertController.swift
//  training apppp
//
//  Created by Susanna R on 30.07.2023.
//

import UIKit

//Логика для алерт контроллера
func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
    alertController.addTextField {
       tf in
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
            print("search info for the \(cityName)")
        }
    }
    //Если пользователь передумал искать
    let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

    alertController.addAction(search)
    alertController.addAction(cancel)
    
}


//
