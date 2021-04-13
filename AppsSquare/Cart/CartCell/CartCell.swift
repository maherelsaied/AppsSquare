//
//  CartCell.swift
//  AppsSquare
//
//  Created by Maher on 4/12/21.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var boldName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var numOfOrder: UILabel!
    
    
    var addAmount : (()->())?
    var minusAmount : (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func minusAction(_ sender: Any) {
        minusAmount?()
    }
    @IBAction func addAction(_ sender: Any) {
        addAmount?()
    }
    
    
    func configCell (data : MenuItem) {
        self.name.text = data.name
        self.boldName.text = data.name
        self.mainImage.image = UIImage(named: data.thumbnailImage)
        self.price.text = "\(data.price * (data.numOfOrder ?? 1)) $"
        self.numOfOrder.text = String(data.numOfOrder ?? 1)
    }
}
