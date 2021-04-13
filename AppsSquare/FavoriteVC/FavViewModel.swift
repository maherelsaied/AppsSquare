//
//  FavViewModel.swift
//  AppsSquare
//
//  Created by Maher on 4/12/21.
//

import Foundation
import CoreData
class faveViewModel {
    
    let coreDataManger = CoreDataManger()
    func getFavData () ->[Favorite] {
        return self.coreDataManger.fetchEvents()
    }
}
