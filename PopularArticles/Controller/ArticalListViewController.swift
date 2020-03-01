//
//  ArticalListViewController.swift
//  PopularArticles
//
//  Created by Raj Maurya on 01/03/20.
//  Copyright © 2020 Raj Maurya. All rights reserved.
//

import UIKit


let articalCellIdentifier = "ListTableViewCell"
class ArticalListViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    let manager = ListViewModel(apiClient:ApiManager())
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate =  self
        // Do any additional setup after loading the view.
    }
    override  func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
         manager.callNYArticalAPI(endPoint:NYArticalAPI.getArtical )
    }
    
}


extension ArticalListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager.articals.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: articalCellIdentifier, for: indexPath) as! ListTableViewCell
        
        cell.articalData =  manager.articals[indexPath.row]
        cell.selectionStyle = .none
        return cell
        
    }
}



extension ArticalListViewController:updateDataDelegate{
    func updateView(isSuccess: Bool, withNewLayout: Bool) {
        if  isSuccess{
            listTableView.reloadData()
        }
    }
}

