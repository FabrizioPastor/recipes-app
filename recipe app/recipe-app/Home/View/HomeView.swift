//
//  HomeView.swift
//  recipe app
//
//  Created by FABRIZIO on 7/11/22.
//

import UIKit
import Foundation
import RxSwift
import Kingfisher
import SkeletonView

class HomeView: UIViewController {

    deinit {
        print("Liberando homeView")
    }
    
    //MARK: - Constants
    private let skeletonViewRows = 5
    
    //MARK: - Atributos
    var viewModel: HomeViewModel?
    
    //MARK: - Outlets
    @IBOutlet weak var recipeTableView: UITableView!
    
    //MARK: - Métodos de clase
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        stupViews()
        setupSkeleton()
        viewModel?.onViewDidLoad()
    }

    //MARK: - Métodos de usuario
    private func stupViews() {
        self.navigationItem.title = viewModel?.title
        self.navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
    }
    
    private func configureTableView() {
        recipeTableView.register(UINib(nibName: CustomRecipeCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: CustomRecipeCell.identifier)
        recipeTableView.estimatedRowHeight = 170
        recipeTableView.rowHeight = 170
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.recipeTableView.hideSkeleton()
            self.recipeTableView.reloadData()
        }
    }
    
    private func setupSkeleton() {
        self.recipeTableView.isSkeletonable = true
        self.recipeTableView.showAnimatedGradientSkeleton()
    }
}

extension HomeView: UITableViewDelegate, SkeletonTableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //viewModel.makeDetailView(recipeId: self.recipes[indexPath.row].id)
    }
        
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.recipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomRecipeCell.identifier, for: indexPath) as? CustomRecipeCell else { return UITableViewCell() }
        
        if let recipes = viewModel?.recipes {
            cell.update(with: recipes[indexPath.row])
        }
        
        return cell
    }
    
    //MARK: - SkeletonTableViewDataSource
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
       return CustomRecipeCell.identifier
    }
     
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return skeletonViewRows
    }
}

