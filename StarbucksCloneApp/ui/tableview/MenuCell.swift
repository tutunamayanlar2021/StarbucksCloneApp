//
//  MenuCell.swift
//  StarbucksCloneApp
//
//  Created by Kader Oral on 27.08.2023.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var menuTableViewImage: UIImageView!
    
    @IBOutlet weak var menuTableViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
