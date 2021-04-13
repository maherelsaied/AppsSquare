//
//  HomeCell.swift
//  AppsSquare
//
//  Created by Maher on 4/10/21.
//

import UIKit

class HomeCell: UITableViewCell {

    @IBOutlet weak var favoriteOut: UIButton!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var detaiels: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Foodimage: UIImageView!
    var favoriteCluser : (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configCell (data : MenuItem ) {
        self.name.text = data.name
        self.Foodimage.image = UIImage(named: data.mainImage)
        self.detaiels.text = data.description
        self.price.text = "\(data.price) $"
        
    }
    
    
    func configCell (data : Favorite ) {
        self.name.text = data.name
        self.Foodimage.image = UIImage(named: data.mainImage ?? "")
        self.detaiels.text = data.description1
        self.price.text = "\(data.price) $"
        self.favoriteOut.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        
    }
    
    
    
    @IBAction func favoriteAction(_ sender: Any) {
        self.favoriteOut.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        favoriteCluser?()
    }
    
}
