//
//  MCategories.swift
//  smart-ranking-badminton
//
//  Created by PRO on 12/14/25.
//

import UIKit

private let imageNames = ["vegan.png", "dessesrt.png", "snacks.png", "drinks.png", "meal"]

var titles = ["Vegan", "Snacks", "Drinks", "Meals", "Dessert"]

class MCategories : UIButton {
    @IBOutlet weak var scBtn: UIButton!
    @IBOutlet weak var firstbtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
   
    private func setupViews() {
        // output first btn = image trong arr
//        if let img = UIImage(named: imageNames.first ?? "") {
//                firstbtn.setImage(img, for: .normal)
//            }
//        // output sc btn = text trong arr
//        scBtn.setTitle(titles.first, for: .normal)
    }
}





