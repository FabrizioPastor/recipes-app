//
//  DetailView.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import UIKit

class DetailView: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var recipeDescription: UILabel!
    @IBOutlet weak var recipeBackgrounImage: UIImageView!
    
    //MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradient()
    }
    
    //MARK: - User Methods
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.systemBackground.cgColor ]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 1)
    }
}
