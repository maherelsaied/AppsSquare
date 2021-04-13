//
//  HomeViewModel.swift
//  AppsSquare
//
//  Created by Maher on 4/12/21.
//

import Foundation


class HomeViewModel {
    
    
    func getData() -> [MenuSection]{
        let menuVM = Bundle.main.decode([MenuSection].self, from: "menu.json")
        return menuVM
    }
    
}
