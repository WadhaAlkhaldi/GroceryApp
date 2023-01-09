//
//  Grocery.swift
//  GroceryApp
//
//  Created by Wadha Alkhaldi on 16/06/1444 AH.
//

import Foundation
import Firebase

struct Grocery{
    let ref: DatabaseReference?
    let key: String
    var itemName: String
    let userId: String
    
    init( itemName: String, userId: String, key: String=""){
        self.ref = nil
        self.key = key
        self.itemName = itemName
        self.userId = userId
    }
    init?(snapshot:DataSnapshot){
        guard
            let value = snapshot.value as?[String: AnyObject],
            let itemName = value["itemName"] as? String,
            let userId = value["userId"] as? String else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.itemName = itemName
        self.userId = userId
                
    }
    
    func toAnyObject() -> Any {
        
        return [ "itemName": itemName, "userId": userId]
    }
}
