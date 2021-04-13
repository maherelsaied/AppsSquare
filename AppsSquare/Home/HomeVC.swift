//
//  ViewController.swift
//  AppsSquare
//
//  Created by Maher on 4/10/21.
//

import UIKit
import CoreData

class HomeVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var menu : [MenuSection] = []
    var filteredArr : [MenuSection] = []
    var isSearch : Bool = false
    var collectionSelected : IndexPath?
    var homeViewModel = HomeViewModel()
    let coreDataManger = CoreDataManger()
    var selectedSlider : slider = .Breakfast {
        didSet {
            self.tableView.reloadWithAnimation()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setnavBar()
      
        setUpTableView()
    }

    func getData(){
        self.menu = homeViewModel.getData()
        self.tableView.reloadData()
    }
    
    func setnavBar() {
        
        self.navigationItem.title = "Hello"
        self.settwoButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setUpTableView() {
        tableView.register(UINib(nibName: "HomeHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "HomeHeader")
        tableView.register(UINib(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: "HomeCell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}



