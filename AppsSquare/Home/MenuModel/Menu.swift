//
//  Menu.swift
//  AppsSquare
//
//  Created by Maher on 4/11/21.
//

import Foundation


struct MenuSection: Codable , Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}

class MenuItem: Codable , Identifiable {
    var id: String
    var name: String
    var photoCredit: String
    var price: Int
    var numOfOrder : Int? = 1
    var restrictions: [String]
    var description: String

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    
    func addnum (num : Int) {
        self.numOfOrder = num
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
    
    
    init(object : Favorite) {
        self.id = object.id ?? ""
        self.name = object.name ?? ""
        self.description = object.description1 ?? ""
        self.numOfOrder = Int(object.numOfOrder)
        self.price = Int(object.price)
        self.photoCredit = object.photoCredit ?? ""
        self.restrictions = object.restrictions ?? []
    }
   

    #if DEBUG
//    static let example = MenuItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
}
