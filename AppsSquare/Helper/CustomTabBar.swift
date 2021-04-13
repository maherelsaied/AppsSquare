//
//  CustomTabBar.swift
//  AppsSquare
//
//  Created by Maher on 4/10/21.
//

import UIKit

class CustomTab : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        tabBar.shadowImage = UIImage()
//        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = UIColor.gray
    }
    
  
    override func viewDidLayoutSubviews() {
        tabBar.frame = CGRect(x: 30, y: self.view.frame.maxY-90, width: tabBar.frame.size.width - 60, height: 60)
        tabBar.setrRoundCorners(corners: .allCorners, radius: 30)
        }
    
}






extension UITabBar {
    
    
    func setrRoundCorners(corners:UIRectCorner, radius: CGFloat) {

        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
                 
            
        }
    }
}





