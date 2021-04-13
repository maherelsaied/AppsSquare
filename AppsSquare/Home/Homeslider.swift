//
//  Homeslider.swift
//  AppsSquare
//
//  Created by Maher on 4/12/21.
//

import UIKit

extension HomeVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeSliderCell", for: indexPath) as! HomeSliderCell
        cell.titleLbl.text = self.menu[indexPath.row].name
        if cell.isSelected {
            cell.mainView.backgroundColor = #colorLiteral(red: 0.9997444749, green: 0.9936888814, blue: 0.7727091908, alpha: 1)
            cell.selectedView.alpha = 1
           }else {
            cell.mainView.backgroundColor = .white
            cell.selectedView.alpha = 0
           }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var w : CGFloat = 0.0
        switch indexPath.row {
        case 0 :
            w = collectionView.frame.width/3.2
        case 2 :
            w = collectionView.frame.width/3.5
        default:
            w = collectionView.frame.width/4.3
        }
        let h : CGFloat = 50
        return CGSize(width: w, height: h)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
        self.collectionSelected = indexPath
        let sliderName = self.menu[indexPath.row].name
        if sliderName == "Breakfast" {
            self.selectedSlider = .Breakfast
        }else if sliderName == "Mains"{
            self.selectedSlider = .Mains
        }else if sliderName == "Dessert" {
            self.selectedSlider = .Dessert
        }else{
            self.selectedSlider = .Drinks
        }
        
    }
    
    
}





