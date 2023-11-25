//
//  HomeTableViewHeader.swift
//  Travel
//
//  Created by Felipe Dias on 22/11/23.
//

import UIKit

class HomeTableViewHeader: UIView {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bannerImageView: UIImageView!
    @IBOutlet weak var bannerView: UIView!
    
    func configView() {
        headerView.backgroundColor = UIColor(
            red: 30.0/255,
            green: 59.0/255,
            blue: 119.0/255,
            alpha: 1
        )
        
        bannerView.layer.cornerRadius = 10
        bannerView.layer.masksToBounds = true
        headerView.layer.cornerRadius = UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 500 : 200
        headerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
}
