//
//  Order.swift
//  AppsSquare
//
//  Created by Maher on 4/12/21.
//

import Foundation

class Order : ObservableObject{
    
    var items = [MenuItem]()
    static let sharedInstanceCert = Order()
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + $1.price * ($1.numOfOrder ?? 1) }
        } else {
            return 0
        }
    }

    func add(item: MenuItem , countOfOrder : Int) {
        
        if items.count == 0 {
            item.addnum(num: countOfOrder)
            items.append(item)
        }else{
            for x in items {
                if x.name == item.name {
                    x.addnum(num: countOfOrder)
                    return
                }
            }
            item.addnum(num: countOfOrder)
            items.append(item)
            
        }
      
    }

    func remove(item: MenuItem) {
//        if let index = items.firstIndex(of: item) {
//            items.remove(at: index)
//        }
    }
}
