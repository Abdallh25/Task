    //
    //  Home+Delegates.swift
    //  Task
    //
    //  Created by A.Badawy on 2/17/20.
    //  Copyright © 2020 A.Badawy. All rights reserved.
    //

    import Foundation
    import UIKit

    extension HomeViewController : UITableViewDelegate , UITableViewDataSource {
        
        func registerCell(){
            tableView.register(UINib(nibName: "HitCell", bundle: nil), forCellReuseIdentifier: "HitCell")
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let item = items[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "HitCell") as! HitCell
            if let img = item.largeImageURL {
                let url = URL(string: img)
                cell.imgeViwe?.kf.setImage(with: url)
                if let likes = item.likes {
                    cell.likeLable.text = String (likes)
                }
                cell.nameLabel.text = item.user
            }
            return cell
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return items.count
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 300
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let item = items[indexPath.row]
            performSegue(withIdentifier: "Details", sender: item)
        }
        
        
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cell.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            UIView.animate(withDuration: 0.5) {
                cell.transform = CGAffineTransform.identity
            }
        }
        
        
    }

