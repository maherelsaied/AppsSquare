//
//  CartVC.swift
//  AppsSquare
//
//  Created by Maher on 4/11/21.
//

import UIKit

class CartVC: UIViewController {
    
    @IBOutlet weak var cartIsEmpty: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var cartOrder : [MenuItem] = Order.sharedInstanceCert.items
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setUpTable()
        
    }
    
    func setStyle () {
        navigationController?.navigationBar.prefersLargeTitles = true
        if cartOrder.count == 0{
            self.tableView.alpha = 0
            self.cartIsEmpty.alpha = 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setbackItem()
        setStyle()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "Cart"
    }
    
    
    func setUpTable() {
        tableView.register(UINib(nibName: "CartCell", bundle: nil), forCellReuseIdentifier: "CartCell")
        tableView.register(UINib(nibName: "CartFooter", bundle: nil), forHeaderFooterViewReuseIdentifier: "CartFooter")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}





