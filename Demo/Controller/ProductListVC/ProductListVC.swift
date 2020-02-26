//
//  ProductListVC.swift
//  Demo
//
//  Created by Shashikant's_Macmini on 26/02/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit
import CoreData

final class ProductListVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK:- Variables
    var user: User?
    var arrProducts = [Product]()
    var arrSelectedData = Set<Product>()
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
        refreshData()
    }
    
    // MARK:- Button Actions
    @IBAction private func btnAddUserPressed(_ sender: UIBarButtonItem) {
        pushAddNewUser()
    }
    @IBAction private func btnDonePressed(_ sender: UIBarButtonItem) {
        user?.products = nil
        for objProduct in arrSelectedData {
            user?.addToProducts(objProduct)
            objProduct.user = user
        }
        
        do {
            try CoreData.context?.save()
        } catch {
            print("Failed add Product to user")
        }
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    // MARK:- Custom Methods
    func refreshData() {
        if let user = self.user {
            arrSelectedData = Set(Product.fetch(user: user))
            arrProducts = Product.fetchAll(user: user)
        } else {
            arrProducts = Product.fetchAll()
        }
        tableView.reloadData()
    }
    
    // MARK:- Push Methods
    func pushAddNewUser() {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: String(describing: AddNewVC.self)) as? AddNewVC else { return }
        vc.isUser = false
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
