//
//  HomeViewController.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 08/06/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let vm = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sports List"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: R.reuseIdentifier.homeCellIdentifier.identifier, bundle: nil), forCellReuseIdentifier: "HomeCell")
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.sportsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.homeCellIdentifier.identifier, for: indexPath) as! HomeCell
        
        let data = vm.sportsModel?.sports[indexPath.row]
        
        cell.sportsImage.loadImage(link: (data?.strSportThumb)!)
        cell.sportsTitle.text = data?.strSport
        cell.sportsDesc.text = data?.strSportDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = SportsDetailVC(nibName: "SportsDetailVC", bundle: nil)
        
        let data = vm.sportsModel?.sports[indexPath.row]
        
        detail.sportImage.load(link: data!.strSportThumb)
        detail.sportTitle.text = data?.strSport
        detail.sportFormat.text = data?.strFormat
        detail.sportDesc.text = data?.strSportDescription
    }
}
