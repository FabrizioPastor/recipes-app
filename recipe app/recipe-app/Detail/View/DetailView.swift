//
//  DetailView.swift
//  recipe app
//
//  Created by FABRIZIO on 8/11/22.
//

import UIKit
import RxSwift
import SkeletonView

class DetailView: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var mapButton: UIButton!
    @IBOutlet weak var recipeDescription: UILabel!
    @IBOutlet weak var recipeBackgrounImage: UIImageView!
    
    //MARK: - Atributos
    var router = DetailRouter()
    var viewModel = DetailViewModel()
    var recipeId: Int?
    let disposeBag = DisposeBag()
    var recipeDetail: RecipeDetail?
    
    //MARK: - Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupSkeleton()
        viewModel.bind(view: self, router: router)
        getDetailData()
    }
    
    
    @IBAction func viewMapPressed(_ sender: UIButton) {
        guard let coordenates = self.recipeDetail?.countryCoordenates else {return}
        viewModel.makeMapView(coordenates: coordenates)
    }
    
    //MARK: - User Methods
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.systemBackground.cgColor ]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 1)
    }
    
    private func configureView() {
        addGradient()
        mapButton.layer.borderWidth  = 1
        mapButton.layer.cornerRadius = 5.0
        mapButton.layer.borderColor = UIColor.label.cgColor
        mapButton.titleLabel?.textColor = UIColor.label
        navigationController?.navigationBar.tintColor = .label
    }
    
    private func getDetailData() {
        startSkeleton()
        guard let recipeId = recipeId else {return}
        viewModel.getRecipeData(recipeId: recipeId )
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { recipes in
                self.recipeDetail = recipes
                self.UpdateView()
            }).disposed(by: disposeBag)
    }
    
    private func UpdateView() {
        DispatchQueue.main.async {
            self.stopSkeleton()
            self.recipeTitle.text = self.recipeDetail?.name
            self.recipeDescription.text = self.recipeDetail?.description
            guard let url = URL(string: self.recipeDetail?.image ?? "") else { return }
            self.recipeBackgrounImage.kf.setImage(with: url)
        }
    }
    
    private func setupSkeleton() {
        recipeTitle.isSkeletonable = true
        recipeTitle.skeletonCornerRadius = 10
        recipeDescription.isSkeletonable = true
        recipeDescription.skeletonCornerRadius  = 10
        recipeBackgrounImage.isSkeletonable = true
        recipeBackgrounImage.skeletonCornerRadius = 10
    }
    
    private func startSkeleton() {
        recipeTitle.showAnimatedGradientSkeleton()
        recipeDescription.showAnimatedGradientSkeleton()
        recipeBackgrounImage.showAnimatedGradientSkeleton()
    }
    
    private func stopSkeleton() {
        recipeTitle.hideSkeleton()
        recipeDescription.hideSkeleton()
        recipeBackgrounImage.hideSkeleton()
    }
}
