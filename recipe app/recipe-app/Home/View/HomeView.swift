//
//  HomeView.swift
//  recipe app
//
//  Created by FABRIZIO on 7/11/22.
//

import UIKit
import Foundation
import RxSwift
import SDWebImage
import SkeletonView

class HomeView: UIViewController {

    deinit {
        print("Liberando homeView")
    }
    
    //MARK: - Atributos
    var viewModel: HomeViewModel?
    
    //MARK: - Outlets
    @IBOutlet weak var recipeTableView: UITableView!
    
    //MARK: - Métodos de clase
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        configureTableView()
        setupSkeleton()
        viewModel?.onViewDidLoad()
        self.navigationItem.title = "Recipes App"
    }

    //MARK: - Métodos de usuario
    func configureTableView() {
        recipeTableView.register(UINib(nibName: "CustomRecipeCell", bundle: Bundle.main), forCellReuseIdentifier: "CustomRecipeCell")
    }
    
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.recipeTableView.hideSkeleton()
            self.recipeTableView.reloadData()
        }
    }
    
    private func setupSkeleton() {
        self.recipeTableView.isSkeletonable = true
    }
}

extension HomeView: UITableViewDelegate, SkeletonTableViewDataSource {
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //viewModel.makeDetailView(recipeId: self.recipes[indexPath.row].id)
    }
        
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.recipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomRecipeCell", for: indexPath) as? CustomRecipeCell else { return UITableViewCell() }
        
        if let recipes = viewModel?.recipes {
            cell.recipeName.text = recipes[indexPath.row].name
            cell.recipeDificulty.text = recipes[indexPath.row].dificulty
            cell.recipeTime.text = String(recipes[indexPath.row].duration)
            cell.recipeCountry.text = recipes[indexPath.row].originContry
            
            guard let url = URL(string: recipes[indexPath.row].image ) else { return cell }
            cell.reipeImage.sd_setImage(with: url, completed: nil)
        }
        
        return cell
    }
    
    //MARK: - SkeletonTableViewDataSource
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
       return "CustomRecipeCell"
    }
     
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}

