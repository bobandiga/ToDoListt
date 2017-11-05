//
//  CardCollectionViewCell.swift
//  ToDoListt
//
//  Created by air on 05.11.17.
//  Copyright © 2017 Maxilimon. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descrLabel: UILabel!
    @IBOutlet weak var bckgView: UIView!
    @IBOutlet weak var bckgLabelView : UIView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bckgView!.layer.cornerRadius = 20.0
        self.bckgView!.clipsToBounds = true
        
        let blurEffect = UIBlurEffect(style : .extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        bckgLabelView.addSubview(blurEffectView)
        
        let color = UIColor.black.cgColor
        bckgLabelView.layer.borderColor = color
        bckgLabelView.layer.borderWidth = 3
        bckgLabelView.layer.cornerRadius = 20.0
        bckgLabelView.clipsToBounds = true
        
    }
    
}
