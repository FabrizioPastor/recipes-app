//
//  HomeView.swift
//  recipe app
//
//  Created by FABRIZIO on 7/11/22.
//

import UIKit

class HomeView: UIViewController {

    //MARK: - Atributos
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    
    //MARK: - Outlets
    @IBOutlet weak var recipeTableView: UITableView!
    
    //MARK: - Métodos de clase
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(view: self, router: router)
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        configureTableView()
    }

    //MARK: - Métodos de usuario
    func configureTableView() {
        recipeTableView.register(UINib(nibName: "CustomRecipeCell", bundle: Bundle.main), forCellReuseIdentifier: "CustomRecipeCell")
    }
    
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    //MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
        
    //MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomRecipeCell", for: indexPath) as? CustomRecipeCell else { return UITableViewCell() }
        return cell
    }
    
    
}
