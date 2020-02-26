//
//  ProductListVC+TableView.swift
//  Demo
//
//  Created by Shashikant's_Macmini on 26/02/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

// MARK:- Extension For :- UITableViewDelegate
extension ProductListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard user != nil else { return }
        if arrSelectedData.contains(arrProducts[indexPath.row]) {
            arrSelectedData.remove(arrProducts[indexPath.row])
        } else {
            arrSelectedData.insert(arrProducts[indexPath.row])
        }
        tableView.reloadData()
    }
} //extension

// MARK:- Extension For :- UITableViewDataSource
extension ProductListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductListCell.self), for: indexPath) as? ProductListCell else { fatalError() }
        cell.lblProducteName.text = arrProducts[indexPath.row].name ?? ""
        cell.lblProducteName.textColor = arrSelectedData.contains(arrProducts[indexPath.row]) ? .green : .black
        return cell
    }
} //extension
