//
//  UserCell.swift
//  TeleGram
//
//  Created by Konstantine Piterman on 7/27/17.
//  Copyright © 2017 Konstantine Piterman. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var firstNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCheckmark(selected: false)
    }
    
    func updateUI(user: User) {
        
        firstNameLbl.text = user.firstName
        
        
    }

    func setCheckmark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
        
        
    }
    
}
