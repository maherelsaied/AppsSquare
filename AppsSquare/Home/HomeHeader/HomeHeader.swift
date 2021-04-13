//
//  HomeHeader.swift
//  AppsSquare
//
//  Created by Maher on 4/10/21.
//

import UIKit

class HomeHeader: UITableViewHeaderFooterView {

    @IBOutlet weak var cancelSearch: UIButton!
    
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    var startSearch : ((String)->())?
    
  
    @IBAction func searchAction(_ sender: Any) {
        self.cancelSearch.alpha = 1
        startSearch?(searchTF.text ?? "")
    }
    
    

    @IBAction func cancelSearchAction(_ sender: Any) {
        self.searchTF.text = ""
        self.searchTF.endEditing(true)
        startSearch?(searchTF.text ?? "")
        self.cancelSearch.alpha = 0
    }
    
   
}
