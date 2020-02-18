//
//  ViewController.swift
//  Task
//
//  Created by A.Badawy on 2/16/20.
//  Copyright © 2020 A.Badawy. All rights reserved.
//

import UIKit
class HomeViewController: UIViewController {
    var items = [Hit]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
           tableView.delegate = self
           tableView.dataSource = self
           callApi()
           registerCell()
       }
}


extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Details" {
            if let detailsViewController = segue.destination as? DetailsViewController {
                    detailsViewController.selectedHit = sender as? Hit
            }
        }
    }
}
