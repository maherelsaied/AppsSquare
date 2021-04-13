//
//  Helper.swift
//  A small collection of quick helpers to avoid repeating the same old code.
//
//  Created by Paul Hudson on 23/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import UIKit


extension Bundle {
    
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}

extension UIViewController {
    func settwoButton() {
        let imageBag = UIImage(systemName: "bag.fill")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: imageBag , landscapeImagePhone: imageBag, style: .plain, target: self, action: #selector(rightNavBtnAction))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        let imageMenu = UIImage(systemName: "text.justify")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageMenu, landscapeImagePhone: imageMenu, style: .plain, target: self, action: #selector(leftNavBtnAction))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func setbackItem (){
        let imageMenu = UIImage(systemName: "arrow.left")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageMenu, landscapeImagePhone: imageMenu, style: .plain, target: self, action: #selector(leftNavBtnAction))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func setRightItem(){
        let imageBag = UIImage(systemName: "bag.fill")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: imageBag , landscapeImagePhone: imageBag, style: .plain, target: self, action: #selector(rightNavBtnAction))
        navigationItem.rightBarButtonItem?.tintColor = .black
        
        let imageMenu = UIImage(systemName: "arrow.left")
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: imageMenu, landscapeImagePhone: imageMenu, style: .plain, target: self, action: #selector(leftNavBtnAction))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    @objc func rightNavBtnAction () {
        let vc = CartVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func leftNavBtnAction () {
        self.navigationController?.popViewController(animated: true)
    }
}

enum slider : Int{
    case Breakfast , Mains , Dessert , Drinks
}

extension UITableView {

    func reloadWithAnimation() {
        self.reloadData()
        let tableViewWidth = self.bounds.size.width
        let cells = self.visibleCells
        var delayCounter = 0
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: tableViewWidth, y: 0)
        }
        for cell in cells {
            UIView.animate(withDuration: 1.6, delay: 0.08 * Double(delayCounter),usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
