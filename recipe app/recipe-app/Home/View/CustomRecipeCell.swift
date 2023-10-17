//
//  CustomRecipeCell.swift
//  recipe app
//
//  Created by FABRIZIO on 7/11/22.
//

import UIKit
import SkeletonView

class CustomRecipeCell: UITableViewCell {

    
    static var identifier = "\(CustomRecipeCell.self)"
    
    //MARK: - Outlets
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var reipeImage: UIImageView!
    @IBOutlet weak var recipeTime: UILabel!
    @IBOutlet weak var recipeDificulty: UILabel!
    @IBOutlet weak var recipeCountry: UILabel!
    
    @IBOutlet weak var timeTitle: UILabel!
    @IBOutlet weak var dificultyTitle: UILabel!
    @IBOutlet weak var originTitle: UILabel!
    
    
    //MARK: - Métodos de clase
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSkeleton()
        recipeName.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Métodos de usuario
    private func setupSkeleton() {
        self.isSkeletonable = true
        self.reipeImage.isSkeletonable = true
        self.reipeImage.skeletonCornerRadius = 10
        self.recipeName.isSkeletonable =  true
        self.recipeTime.isSkeletonable =  true
        self.recipeDificulty.isSkeletonable =  true
        self.recipeCountry.isSkeletonable =  true
        self.timeTitle.isSkeletonable = true
        self.dificultyTitle.isSkeletonable = true
        self.originTitle.isSkeletonable = true
    }
    
}
