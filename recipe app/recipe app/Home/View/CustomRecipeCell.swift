//
//  CustomRecipeCell.swift
//  recipe app
//
//  Created by FABRIZIO on 7/11/22.
//

import UIKit

class CustomRecipeCell: UITableViewCell {

    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var reipeImage: UIImageView!
    @IBOutlet weak var recipeTime: UILabel!
    @IBOutlet weak var recipeDificulty: UILabel!
    @IBOutlet weak var recipeCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        recipeName.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
