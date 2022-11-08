//
//  HomeView.swift
//  recipe app
//
//  Created by FABRIZIO on 7/11/22.
//

import UIKit
import Foundation
import RxSwift

class HomeView: UIViewController {

    //MARK: - Atributos
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var recipes = [Recipe]()
    private var disposeBag = DisposeBag()
    
    //MARK: - Outlets
    @IBOutlet weak var recipeTableView: UITableView!
    
    //MARK: - Métodos de clase
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        configureTableView()
        getData()
    }

    //MARK: - Métodos de usuario
    func configureTableView() {
        recipeTableView.register(UINib(nibName: "CustomRecipeCell", bundle: Bundle.main), forCellReuseIdentifier: "CustomRecipeCell")
    }
    
    func getData() {
        viewModel.getRecipesData()
            .subscribe(on: MainScheduler.instance)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { recipes in
                self.recipes = recipes
                self.reloadTableView()
            }).disposed(by: disposeBag)
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.recipeTableView.reloadData()
        }
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
        
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomRecipeCell", for: indexPath) as? CustomRecipeCell else { return UITableViewCell() }
        cell.recipeName.text = recipes[indexPath.row].name
        cell.recipeDificulty.text = recipes[indexPath.row].dificulty
        cell.recipeTime.text = String(recipes[indexPath.row].duration)
        cell.recipeCountry.text = recipes[indexPath.row].originContry
        return cell
    }
    
    
}
