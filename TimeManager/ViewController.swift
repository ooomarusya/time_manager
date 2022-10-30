//
//  ViewController.swift
//  TimeManager
//
//  Created by Мария Хныкина on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startStopButton: UIButton!
    // функция вызывается при нажатие на кнопку, sender сама кнопка
    @IBAction func startStopButton(_ sender: UIButton) {
        var state = "start" //состояние кнопки, по умолчанию = старт
        if let stateFromDisk = defaults.string(forKey: "state") { //пробуем получить состояние кнопки с диска
            state = stateFromDisk // присваеваем стате состояние с диска
        }
        
        if state == "start" {
            let formattedDate = getFormattedDate() //готовая дата
            var index = defaults.integer(forKey: "index") // получаем последний доступный индекс строчки с датой
            defaults.set(formattedDate, forKey: String(index)) //записываем на диск тек. дату по индексу
            index += 1
            defaults.set(index, forKey: "index") //записываем новый доступный индекс на диск
            sender.setTitle("Закончить", for: .normal) //обращаемся к кнопке и меняем заголовок
            state = "stop" // смена состояния кнопки
        }else {
            let formattedDate = getFormattedDate()
            let index = defaults.integer(forKey: "index")
            let dataStart = defaults.string(forKey: String(index - 1))
            let formattedDate2 = dataStart! + " - " + formattedDate
            defaults.set(formattedDate2, forKey: String(index - 1))
            sender.setTitle("Начать", for: .normal)
            state = "start"
        }
        
        defaults.set(state, forKey: "state") //сохраняем новое состояние на диск
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        startStopButton.layer.cornerRadius = 10
        var state = "start"
        if let stateFromDisk = defaults.string(forKey: "state") {
            state = stateFromDisk
        }
        if state == "start" {
            startStopButton.setTitle("Начало", for: .normal)
            
        } else {
            startStopButton.setTitle("Конец", for: .normal)
        }
    }
    let defaults = UserDefaults.standard
    func getFormattedDate() -> String {
        let time = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        let formattedDate = formatter.string(from: time as Date)
        return formattedDate
    }
    

}

