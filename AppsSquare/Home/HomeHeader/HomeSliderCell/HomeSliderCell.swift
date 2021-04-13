//
//  HomeSliderCell.swift
//  AppsSquare
//
//  Created by Maher on 4/10/21.
//

import UIKit

class HomeSliderCell: UICollectionViewCell {

    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        
    }
    override var isSelected: Bool {
    didSet {
           if isSelected {
            self.mainView.backgroundColor = #colorLiteral(red: 0.9997444749, green: 0.9936888814, blue: 0.7727091908, alpha: 1)
            self.selectedView.alpha = 1
           }else {
            self.mainView.backgroundColor = .white
            self.selectedView.alpha = 0
           }
       }
   }

}
