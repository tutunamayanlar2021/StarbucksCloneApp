//
//  HomeCellTableViewCell.swift
//  StarbucksCloneApp
//
//  Created by Kader Oral on 18.08.2023.
//

import UIKit

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var homeCellImageView: UIImageView!
    
    @IBOutlet weak var homeCellTitleLabel: UILabel!
    
    
    @IBOutlet weak var homeCellIngredientLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        

        // Configure the view for the selected state
    }

}
