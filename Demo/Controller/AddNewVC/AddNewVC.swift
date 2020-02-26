//
//  AddNewVC.swift
//  Demo
//
//  Created by Shashikant's_Macmini on 26/02/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit
import CoreData

final class AddNewVC: UITableViewController {
    
    // MARK:- Outlets
    @IBOutlet private weak var lblID            : UILabel!
    @IBOutlet private weak var txtfName         : UITextField!
    @IBOutlet private weak var txtfSubDetails   : UITextField!
    
    // MARK:- Variables
    private var id = 0
    var isUser = true
    
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
        self.title = isUser ? "Add New User" : "Add New Product"
        txtfSubDetails.placeholder = isUser ? "Bio" : "Price"
        if isUser {
            id = User.fetchAll().count
        } else {
            id = Product.fetchAll().count
        }
        lblID.text = "\(id)"
    }
    
    // MARK:- Button Actions
    @IBAction private func btnSavePressed(_ sender: UIBarButtonItem) {
        switch isUser {
        case true:
            saveUser()
        case false:
            saveProduct()
        }
    }
    
    // MARK:- Custom Methods
    private func saveUser() {
        let entity = NSEntityDescription.entity(forEntityName: "User", in: CoreData.context!)!
        let newUser = User(entity: entity, insertInto: CoreData.context!)
        newUser.id = Int64(id)
        newUser.name = txtfName.text ?? ""
        newUser.bio = txtfSubDetails.text ?? ""
        
        do {
            try CoreData.context?.save()
        } catch {
            print("Failed saveUser")
        }
        
        guard let vc = self.navigationController?.viewControllers.first as? UserListVC else { return }
        vc.refreshData()
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    private func saveProduct() {
        let entity = NSEntityDescription.entity(forEntityName: "Product", in: CoreData.context!)!
        let newProduct = Product(entity: entity, insertInto: CoreData.context!)
        newProduct.id = Int64(id)
        newProduct.name = txtfName.text ?? ""
        newProduct.price = txtfSubDetails.text ?? ""
        
        do {
            try CoreData.context?.save()
        } catch {
            print("Failed saveProduct")
        }
        
        guard let vcCount = self.navigationController?.viewControllers.count, vcCount > 2, let vc = self.navigationController?.viewControllers[1] as? ProductListVC else { return }
        vc.refreshData()
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
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
