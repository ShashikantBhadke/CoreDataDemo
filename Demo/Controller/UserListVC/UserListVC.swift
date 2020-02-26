//
//  ViewController.swift
//  Demo
//
//  Created by Shashikant's_Macmini on 26/02/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit
import CoreData

final class UserListVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK:- Variables
    var arrUsers = [User]()
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        refreshData()
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK:- Button Actions
    @IBAction private func btnAddUserPressed(_ sender: UIBarButtonItem) {
        pushAddNewUser()
    }
    
    @IBAction private func btnAllProductsPressed(_ sender: UIBarButtonItem) {
        pushPruductList(nil)
    }
    
    // MARK:- Custom Methods
    func refreshData() {
        arrUsers = User.fetchAll()
        tableView.reloadData()
    }
    
    // MARK:- Push Methods
    func pushAddNewUser() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: AddNewVC.self)) as? AddNewVC else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushPruductList(_ user: User?) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: ProductListVC.self)) as? ProductListVC else { return }
        vc.user = user
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK:- ReceiveMemoryWarning
    override func didReceiveMemoryWarning() {
        debugPrint("⚠️🤦‍♂️⚠️ Receive Memory Warning on \(self) ⚠️🤦‍♂️⚠️")
    }
    
    // MARK:-
    deinit {
        debugPrint("🏹 Controller is removed from memory \(self) 🎯 🏆")
    }
    
} //class
