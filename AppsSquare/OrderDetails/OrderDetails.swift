//
//  OrderDetails.swift
//  AppsSquare
//
//  Created by Maher on 4/11/21.
//

import UIKit

class OrderDetails: UIViewController {

    @IBOutlet weak var orderCounter: UILabel!
    @IBOutlet weak var orderNow: UIButton!
    @IBOutlet weak var counterConstrain: NSLayoutConstraint!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var details: UILabel!
    var order : MenuItem?
    var counter : Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setRightItem()
        nameStyle()
        setData()
        
    }
    
    
    func nameStyle () {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tabBarController?.tabBar.isHidden = true
    }
    func setData(){
        if let orderDetails = self.order {
            self.navigationItem.title = orderDetails.name
            self.name.text = orderDetails.name
            self.details.text = orderDetails.description
            self.mainImg.image = UIImage(named: orderDetails.mainImage)
        }
    }

    @IBAction func orderAction(_ sender: Any) {
        self.counter = 1
        self.orderCounter.text = String(self.counter)
        UIView.animate(withDuration: 0.5) {
            self.orderNow.alpha = 0
            self.counterConstrain.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func addCounter(_ sender: Any) {
        self.counter += 1
        self.orderCounter.text = String(self.counter)
    }
    @IBAction func minusCounter(_ sender: Any) {
        
        self.counter -= 1
        self.orderCounter.text = String(self.counter)
        if self.counter == 0 {
            UIView.animate(withDuration: 0.5) {
                self.orderNow.alpha = 1
                self.counterConstrain.constant = 400
                self.view.layoutIfNeeded()
            }
        }
        
    }
    @IBAction func addToCart(_ sender: Any) {
        if let order = self.order{
            Order.sharedInstanceCert.add(item: order , countOfOrder: self.counter)
        }
        print(Order.sharedInstanceCert.items)
    }
    
}
