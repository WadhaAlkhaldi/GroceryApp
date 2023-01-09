//
//  itemsCell.swift
//  GroceryApp
//
//  Created by Wadha Alkhaldi on 16/06/1444 AH.
//

import UIKit

class itemsCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var userLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
