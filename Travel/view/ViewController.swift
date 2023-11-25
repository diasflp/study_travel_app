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
        travelTableView.dataSource = self
        travelTableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionTravel?[section].numberOfLines ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cellTravel = tableView.dequeueReusableCell(withIdentifier: "TravelTableViewCell") as? TravelTableViewCell
        else { fatalError("error to create TravelTableViewCell") }
        
        let viewModel = sectionTravel?[indexPath.section]
        
        switch viewModel?.type {
        case .highlights:
            cellTravel.configCell(viewModel?.travel[indexPath.row])
            return cellTravel
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        headerView?.configView()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 380 : 450
    }
}
