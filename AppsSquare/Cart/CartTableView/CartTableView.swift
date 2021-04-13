//
//  CartTableView.swift
//  AppsSquare
//
//  Created by Maher on 4/12/21.
//

import UIKit



extension CartVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartOrder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        
        
        let data = cartOrder[indexPath.row]
        cell.configCell(data: data)
        
        cell.addAmount = {[weak self] in
            data.numOfOrder! += 1
            cell.numOfOrder.text = String(data.numOfOrder ?? 1)
            cell.price.text = "\(data.price * (data.numOfOrder ?? 1)) $"
            print("\(Order.sharedInstanceCert.total)")
            tableView.beginUpdates()
            if let containerView = tableView.footerView(forSection: indexPath.section) as? CartFooter {
                containerView.total.text = ("\(Order.sharedInstanceCert.total)")
            }
            tableView.endUpdates()
            
        }
        cell.minusAmount = {[weak self] in
            guard let self = self else {return}
            if data.numOfOrder ?? 0 >= 1 {
                data.numOfOrder! -= 1
                cell.numOfOrder.text = String(data.numOfOrder ?? 1)
                cell.price.text = "\(data.price * (data.numOfOrder ?? 1)) $"
                if data.numOfOrder == 0 {
                    self.cartOrder.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                    Order.sharedInstanceCert.items.remove(at: indexPath.row)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            print("\(Order.sharedInstanceCert.total)")
            tableView.beginUpdates()
            if let containerView = tableView.footerView(forSection: indexPath.section) as? CartFooter {
                containerView.total.text = ("\(Order.sharedInstanceCert.total)")
            }
            tableView.endUpdates()
        }
        
        return cell
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CartFooter") as? CartFooter  else { return nil }
        footerView.total.text = "\(Order.sharedInstanceCert.total)"
        return footerView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 260
    }
    
}

