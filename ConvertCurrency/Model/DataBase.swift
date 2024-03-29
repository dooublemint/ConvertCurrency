//
//  DataBase.swift
//  ConvertCurrency
//
//  Created by Ruslan Filistovich on 14/02/2020.
//  Copyright © 2020 Ruslan Filistovich. All rights reserved.
//

import Foundation
import RealmSwift

class DataBase {
    let realm = try! Realm()
    lazy var currency: Results<Currency> = { self.realm.objects(Currency.self) }()
    
    func addNewObject(item: (key: String, value: String)) {
        try! self.realm.write() {
            let newCurrency = Currency()
            newCurrency.index = item.key
            newCurrency.fullDescription = item.value
            self.realm.add(newCurrency)
            print(newCurrency.index)
        }
        self.currency = self.realm.objects(Currency.self)
    }
}

