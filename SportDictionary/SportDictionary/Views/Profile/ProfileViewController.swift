//
//  ProfileViewController.swift
//  SportDictionary
//
//  Created by Mauldy Putra on 08/06/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var tableView = UITableView()
    var menuList = [Menu]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Profile"
        setupTableView()
    }
    
    private func setupTableView(){
        tableView = UITableView()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(22)
            make.right.equalToSuperview().offset(-22)
        }
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(resource: R.nib.profileHeaderCell), forCellReuseIdentifier: R.reuseIdentifier.profileCellHeaderIdentifier.identifier)
        tableView.register(UINib(resource: R.nib.profileCellMenu), forCellReuseIdentifier: R.reuseIdentifier.profileCellMenuIdentifier.identifier)
        tableView.separatorColor = .clear
        tableView.showsVerticalScrollIndicator = false
        
        menuList.append(contentsOf: getMenuList())
        tableView.reloadData()
    }
    
    private func getMenuList () -> [Menu] {
        return [Menu(menuIcon: "", menuTitle: "Tempat / Tanggal Lahir", menuSubtitle: ""),
                Menu(menuIcon: "", menuTitle: "Nomor Telepon", menuSubtitle: ""),
                Menu(menuIcon: "", menuTitle: "Pekerjaan", menuSubtitle: "")]
    }
}

extension ProfileViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:  return 250
        case 1: return 65
        default: return UITableView.automaticDimension
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section != 0){
            return 17
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            let view = UIView(frame: CGRect.zero)
            view.backgroundColor = UIColor.white
            return view
        }
    }
}


extension ProfileViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        case 1: return menuList.count
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            
        case 0:
            var cell = ProfileHeaderCell()
            cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.profileCellHeaderIdentifier.identifier, for: indexPath) as! ProfileHeaderCell
            cell.selectionStyle = .none
            
            return cell
        default:
            var cell = ProfileCellMenu()
            cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.profileCellMenuIdentifier.identifier, for: indexPath) as! ProfileCellMenu
            cell.setContent(image: menuList[indexPath.row].getMenuIcon(), title: menuList[indexPath.row].getMenuTitle(), subtitle: menuList[indexPath.row].getMenuSubtitle())
            cell.selectionStyle = .none
            
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}
