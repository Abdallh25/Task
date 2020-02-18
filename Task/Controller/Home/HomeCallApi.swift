//
//  HomeCallApi.swift
//  Task
//
//  Created by A.Badawy on 2/17/20.
//  Copyright © 2020 A.Badawy. All rights reserved.
//

import Foundation
import Alamofire
import Toast_Swift
extension HomeViewController {
    func callApi(){
        self.view.makeToastActivity(.center)
        Alamofire.request("https://pixabay.com/api/?key=11778875-bd18dbcb72c8cc6ad02f06b46&q=animal+love&image_type=photo").responseJSON { (response) in
            do{
                let hits = try JSONDecoder().decode(Hits.self, from: response.data!)
                print(hits)
                self.items = (hits.hits)!
                print(self.items)
                self.tableView.reloadData()
                self.view.hideToastActivity()
            }catch{
                print("ERROR")
                self.view.hideToastActivity()
                
            }
        }
    }
}
