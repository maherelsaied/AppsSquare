//
//  HomeSlider.swift
//  AppsSquare
//
//  Created by Maher on 4/12/21.
//

import UIKit


extension HomeVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return isSearch ? self.filteredArr[self.selectedSlider.rawValue].items.count
            :  self.menu[self.selectedSlider.rawValue].items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeCell
        
        let data = isSearch ?  self.filteredArr[self.selectedSlider.rawValue].items[indexPath.row] : self.menu[self.selectedSlider.rawValue].items[indexPath.row]
        cell.configCell(data: data)
        cell.favoriteOut.setImage(UIImage(systemName: "heart"), for: .normal)
        let favArr = self.coreDataManger.fetchEvents()
        for fav in favArr {
            if fav.id! == data.id {
                cell.favoriteOut.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
        }
       
        cell.favoriteCluser = {[weak self] in
            guard let self = self else {return}
            if self.coreDataManger.fetchEvents().count != 0 {
            for x in self.coreDataManger.fetchEvents() {
                if data.id == x.id! {
                    self.coreDataManger.removeFav(object: x)
                    cell.favoriteOut.setImage(UIImage(systemName: "heart"), for: .normal)
                    return
                }
            }
                self.coreDataManger.saveEvent(data: data)
                cell.favoriteOut.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }else{
                self.coreDataManger.saveEvent(data: data)
                cell.favoriteOut.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = OrderDetails()
        for item in self.menu {
            if item.name == self.menu[self.selectedSlider.rawValue].name {
                vc.order = item.items[indexPath.row]
            }
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HomeHeader") as? HomeHeader  else { return nil }
       
        headerView.collectionView.register(UINib(nibName: "HomeSliderCell", bundle: nil), forCellWithReuseIdentifier: "HomeSliderCell")
        headerView.collectionView.delegate = self
        headerView.collectionView.dataSource = self
        let selectedIndex = self.collectionSelected ?? IndexPath(row: 0, section: 0)
        headerView.collectionView.selectItem(at: selectedIndex, animated: true, scrollPosition: .left)
        headerView.startSearch = {[weak self] (text) in
            self?.filterData(text: text)
        }
        return headerView
    }

    
    func filterData (text : String) {
        var filterd : [MenuSection] = self.menu
        
        let items = self.menu[self.selectedSlider.rawValue].items
        let searchItem = items.filter({(($0.name).localizedCaseInsensitiveContains(text))})
        filterd[self.selectedSlider.rawValue].items = searchItem
        
        self.filteredArr = filterd
        if(text.count == 0){
                isSearch = false
            }else{
                isSearch = true
            }
        self.tableView.reloadData()
    }

    

    
}
