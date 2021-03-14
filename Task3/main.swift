//
//  main.swift
//  Task3
//
//  Created by user on 11.03.2021.
//

import Foundation

enum engine: String {
    case on = "запущен"
    case off = "заглушен"
}

enum brand {
    case Honda, Shevrolet, Nissan, Lada, Wolksvagen
}

enum window: String {
    case open = "открыто"
    case closed = "закрыто"
}


enum trunkAction {
    case unload, download
}



//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
    
    enum carPossibleActions: String {
        case changeEngineStatus = "Запустить/заглушить двигатель"
        case changeWindowsStatus = "Открыть/закрыть окна"
        case changeTrunkFulledSize = "Погрузить/выгрузить из кузова/багажника груз определенного объема"
    }

//1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.



struct TrunkCar {
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    var brand: brand
    var prodYear = Int()
    var trunkSize = Double()
    var engineIs: engine
    var windowsIs: window
    var trunkFulledSize = Double()
    

//    4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    
// я не совсем понял нужно через один метод все свойства менять или для каждого свойства свой метод нужен? не был уверен, поэтому сделал оба варианта

// 1 Вариант - по методу на свойство
    
// метод 1
    mutating func changeEngineStatus(to newStatus: engine) {
        if engineIs == newStatus {
            print("Двигатель уже был \(engineIs.rawValue)")
        } else {
            engineIs = newStatus
            print("Теперь двигатель \(self.engineIs.rawValue)")
        }
        
    }
    
// метод 2
    mutating func changeWindowsStatus(to newStatus: window) {
        if windowsIs == newStatus {
            print("Окно уже было \(windowsIs.rawValue)")
        } else {
            windowsIs = newStatus
            print("Теперь окно \(windowsIs.rawValue)")
        }
        
    }
// метод 3
    mutating func changeTrunkFulledSize(action: trunkAction, to size: Double) {
        switch action {
        case .download:
            // проверяем можно ли загрузить в багажник указанный объем вещей
            if trunkFulledSize + size > trunkSize {
                print("Загружаемый объем превышает общий объем багажника на \(trunkFulledSize + size - trunkSize)")
            } else {
                trunkFulledSize += size
                print("Теперь объем багажника увеличился на \(size) и стал : \(trunkFulledSize)")
            }
            
        default:
            // проверяем можно ли выгрузить из багажника указанный объем вещей
            if trunkFulledSize < size {
                print("Выгружаемый объем вещей больше объема хранящихся на: \(size - trunkFulledSize)")
            } else {
                trunkFulledSize -= size
                print("Теперь объем багажника уменьшился на \(size) и стал : \(trunkFulledSize)")
            }
        }
    }
    
// 2 Вариант - все в одном методе
        
        mutating func changes(action: carPossibleActions, size: Double? = 0) {

            switch action {

            case .changeEngineStatus:
                if engineIs == engine.off {
                    engineIs = engine.on
                } else {
                    engineIs = engine.off
                }
                print("Теперь \(engineIs.rawValue)")

            case .changeWindowsStatus:
                if windowsIs == window.closed{
                    windowsIs = window.open
                } else {
                    windowsIs = window.closed
                }
                print("Теперь \(windowsIs.rawValue)")

            default :
                if size == 0 {

                    print("Вы не указали выгружаемый или загружаемый объем, чтобы это сделать укажите в функции значение параметра 'size' с соответствующим знаком")

                } else if -trunkFulledSize > size! {

                    print("Выгружаемый объем вещей больше объема хранящихся")

                } else if trunkFulledSize + size! > trunkSize {

                    print("Загружаемый объем превышает общий объем багажника на \(trunkFulledSize + size! - trunkSize)")

                } else {
                    trunkFulledSize += size!
                    print("Теперь объем багажника изменился на \(size!) и стал : \(trunkFulledSize)")
                }
            }
        }
        
    //    6. Вывести значения свойств экземпляров в консоль.
        func printInfo() {
            print("Марка: \(brand)")
            print("Год выпуска: \(prodYear)")
            print("Размер багажника: \(trunkSize)")
            print("Cостояние двигателя: \(engineIs.rawValue)")
            print("Cостояние окон: \(windowsIs)")
            print("Заполненный объем багажника: \(trunkFulledSize)")
            print("Возможные действия с автомобилем:  \n - \(carPossibleActions.changeEngineStatus.rawValue) \n - \(carPossibleActions.changeWindowsStatus.rawValue) \n - \(carPossibleActions.changeTrunkFulledSize.rawValue)")
        }

}

struct SportCar  {
    
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
    var brand: brand
    var prodYear = Int()
    var trunkSize = Double()
    var engineIs: engine
    var windowsIs: window
    var trunkFulledSize = Double()

//    4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
    
// я не совсем понял нужно через один метод все свойства менять или для каждого свойства свой метод нужен? не был уверен, поэтому сделал оба варианта

// 1 Вариант - по методу на свойство
    
// метод 1
    mutating func changeEngineStatus(to newStatus: engine) {
        if engineIs == newStatus {
            print("Двигатель уже был \(engineIs.rawValue)")
        } else {
            engineIs = newStatus
            print("Теперь двигатель \(self.engineIs.rawValue)")
        }
        
    }
    
// метод 2
    mutating func changeWindowsStatus(to newStatus: window) {
        if windowsIs == newStatus {
            print("Окно уже было \(windowsIs.rawValue)")
        } else {
            windowsIs = newStatus
            print("Теперь окно \(windowsIs.rawValue)")
        }
        
    }
// метод 3
    mutating func changeTrunkFulledSize(action: trunkAction, to size: Double) {
        switch action {
        case .download:
            // проверяем можно ли загрузить в багажник указанный объем вещей
            if trunkFulledSize + size > trunkSize {
                print("Загружаемый объем превышает общий объем багажника на \(trunkFulledSize + size - trunkSize)")
            } else {
                trunkFulledSize += size
                print("Теперь объем багажника увеличился на \(size) и стал : \(trunkFulledSize)")
            }
            
        default:
            // проверяем можно ли выгрузить из багажника указанный объем вещей
            if trunkFulledSize < size {
                print("Выгружаемый объем вещей больше объема хранящихся на: \(size - trunkFulledSize)")
            } else {
                trunkFulledSize -= size
                print("Теперь объем багажника уменьшился на \(size) и стал : \(trunkFulledSize)")
            }
        }
    }

    
// 2 Вариант - все в одном методе
    
    mutating func changes(action: carPossibleActions, size: Double? = 0) {

        switch action {

        case .changeEngineStatus:
            if engineIs == engine.off {
                engineIs = engine.on
            } else {
                engineIs = engine.off
            }
            print("Теперь \(engineIs.rawValue)")

        case .changeWindowsStatus:
            if windowsIs == window.closed{
                windowsIs = window.open
            } else {
                windowsIs = window.closed
            }
            print("Теперь \(windowsIs.rawValue)")

        default :
            if size == 0 {

                print("Вы не указали выгружаемый или загружаемый объем, чтобы это сделать укажите в функции значение параметра 'size' с соответствующим знаком")

            } else if -trunkFulledSize > size! {

                print("Выгружаемый объем вещей больше объема хранящихся")

            } else if trunkFulledSize + size! > trunkSize {

                print("Загружаемый объем превышает общий объем багажника на \(trunkFulledSize + size! - trunkSize)")

            } else {
                trunkFulledSize += size!
                print("Теперь объем багажника изменился на \(size!) и стал : \(trunkFulledSize)")
            }
        }
    }
    
//    6. Вывести значения свойств экземпляров в консоль.
    func printInfo() {
        print("Марка: \(brand)")
        print("Год выпуска: \(prodYear)")
        print("Размер багажника: \(trunkSize)")
        print("Cостояние двигателя: \(engineIs.rawValue)")
        print("Cостояние окон: \(windowsIs)")
        print("Заполненный объем багажника: \(trunkFulledSize)")
        print("Возможные действия с автомобилем:  \n - \(carPossibleActions.changeEngineStatus.rawValue) \n - \(carPossibleActions.changeWindowsStatus.rawValue) \n - \(carPossibleActions.changeTrunkFulledSize.rawValue)")
    }
    
}

//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var car1 = SportCar(brand: .Nissan, prodYear: 1999, trunkSize: 20, engineIs: .on, windowsIs: .closed, trunkFulledSize: 10.0)

car1.changeTrunkFulledSize(action: .unload, to: 10)
car1.changeWindowsStatus(to: .closed)

var truncCar1 = TrunkCar(brand: .Lada, prodYear: 2005, trunkSize: 20, engineIs: .off, windowsIs: .open, trunkFulledSize: 10)

truncCar1.changeEngineStatus(to: .on)


//6. Вывести значения свойств экземпляров в консоль.
car1.printInfo()
truncCar1.printInfo()


