//
//  HomeView.swift
//  recipe app
//
//  Created by FABRIZIO on 7/11/22.
//

import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var recipeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        configureTableView()
    }

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
