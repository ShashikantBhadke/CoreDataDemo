//
//  UserListVC+TableView.swift
//  Demo
//
//  Created by Shashikant's_Macmini on 26/02/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit
import CoreData

// MARK:- Extension For :- UITableViewDelegate
extension UserListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushPruductList(arrUsers[indexPath.row])
    }
} //extension

// MARK:- Extension For :- UITableViewDataSource
extension UserListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UserListCell.self), for: indexPath) as? UserListCell else { fatalError() }
        cell.setValues(strName: arrUsers[indexPath.row].name ?? "", strProductList: "\((arrUsers[indexPath.row].products ?? []).count)")
        return cell
    }
    
    
} //extension
