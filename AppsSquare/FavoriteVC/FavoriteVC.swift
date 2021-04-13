//
//  FavoriteVC.swift
//  AppsSquare
//
//  Created by Maher on 4/12/21.
//

import UIKit
import CoreData
class FavoriteVC: UIViewController {

    @IBOutlet weak var noData: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var favViewModel = faveViewModel()
    let coreDataManger = CoreDataManger()
    var favArray : [Favorite] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView ()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.navigationItem.title = "Favorite"
        self.settwoButton()
        getData ()
        
    }
    
    func getData () {
        favArray = favViewModel.getFavData()
        favArray.count == 0 ? (self.tableView.alpha = 0) : (self.tableView.alpha = 1)
        self.tableView.reloadData()
    }
    
    func setTableView (){
        self.tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = OrderDetails()
        let order = favArray[indexPath.row]
        let sendOrder = MenuItem(object: order)
        vc.order = sendOrder
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
   
}


extension FavoriteVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let data = favArray[indexPath.row]
        cell.configCell(data: data)
        
        cell.favoriteCluser = {[weak self] in
            guard let self = self else {return}
            for x in self.coreDataManger.fetchEvents() {
                if data.id == x.id! {
                    self.coreDataManger.removeFav(object: x)
                }
            }
            self.favArray = self.favViewModel.getFavData()
            self.favArray.count == 0 ? (self.tableView.alpha = 0) : (self.tableView.alpha = 1)
            self.tableView.reloadData()
            
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
