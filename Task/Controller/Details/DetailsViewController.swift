//
//  DetailsViewController.swift
//  Task
//
//  Created by A.Badawy on 2/16/20.
//  Copyright © 2020 A.Badawy. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    var selectedHit : Hit?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var likeLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let Hit = selectedHit {
            configureViews(item: Hit)
        }
    }
    func configureViews(item : Hit){
        nameLable.text = item.user
        if let likes = item.likes { likeLable.text = String (likes)}
        if let img = item.largeImageURL { let url = URL(string: img)
            imageView?.kf.setImage(with: url)}
    }
}
