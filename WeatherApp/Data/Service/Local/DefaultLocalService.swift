//
//  DefaultLocalService.swift
//  WeatherApp
//
//  Created by Анатолий Ем on 23.02.2021.
//

import Foundation
import RealmSwift

class DefaultLocalService: LocalService {
    
    let realm = try! Realm()
    
    func save<T: Object>(object: T) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func deleate<T: Object>(object: T) {
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func load<T>(object: T) -> Results<Object> {
        let objects = realm.objects(object.self as! Object.Type)
        return objects
    }
}
