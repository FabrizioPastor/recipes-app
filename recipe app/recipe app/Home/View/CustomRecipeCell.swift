//
//  CustomRecipeCell.swift
//  recipe app
//
//  Created by FABRIZIO on 7/11/22.
//

import UIKit
import SkeletonView

class CustomRecipeCell: UITableViewCell {

    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var reipeImage: UIImageView!
    @IBOutlet weak var recipeTime: UILabel!
    @IBOutlet weak var recipeDificulty: UILabel!
    @IBOutlet weak var recipeCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSkeleton()
        recipeName.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupSkeleton() {
        self.isSkeletonable = true
        self.reipeImage.isSkeletonable = true
        self.reipeImage.skeletonCornerRadius = 10
        self.recipeName.isSkeletonable =  true
        recipeName.skeletonCornerRadius = 30
        self.recipeTime.isSkeletonable =  true
        recipeTime.skeletonCornerRadius = 30
        self.recipeDificulty.isSkeletonable =  true
        recipeDificulty.skeletonCornerRadius = 30
        self.recipeCountry.isSkeletonable =  true
        recipeCountry.skeletonCornerRadius = 30
        
    }
    
}
