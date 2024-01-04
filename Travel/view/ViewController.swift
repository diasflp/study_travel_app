//
//  ViewController.swift
//  Travel
//
//  Created by Felipe Dias on 22/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var travelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        view.backgroundColor = UIColor(
            red: 30.0/255,
            green: 59.0/255,
            blue: 119.0/255,
            alpha: 1
        )
    }
    
    func configTableView() {
        travelTableView.register(UINib(
            nibName: "TravelTableViewCell",
            bundle: nil
        ), forCellReuseIdentifier: "TravelTableViewCell")
        travelTableView.register(UINib(
            nibName: "OffersTableViewCell",
            bundle: nil
        ), forCellReuseIdentifier: "OffersTableViewCell")
        travelTableView.dataSource = self
        travelTableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTravel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionTravel?[section].numberOfLines ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = sectionTravel?[indexPath.section]
        
        switch viewModel?.type {
        case .highlights:
            guard  let cellTravel = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell") as? TravelTableViewCell
            else { fatalError("error to create TravelTableViewCell") }
            
            cellTravel.configCell(viewModel?.travel[indexPath.row])
            return cellTravel
            
        case .offers:
            guard let cellOffer = tableView.dequeueReusableCell(withIdentifier: "OffersTableViewCell") as? OffersTableViewCell
            else { fatalError("error to create OffersTableViewCell") }
            
            return cellOffer
            
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
            headerView?.configView()
            
            return headerView
        }
        
        return nil
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 300
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 380 : 450
    }
}
