//
//  UserListCell.swift
//  Demo
//
//  Created by Shashikant's_Macmini on 26/02/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

final class UserListCell: UITableViewCell {

    // MARK:- Outlets
    @IBOutlet private weak var lblUserName: UILabel!
    @IBOutlet private weak var lblProductes: UILabel!
    
    // MARK:- Default Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK:- Custom methods
    func setValues(strName: String, strProductList: String) {
        lblUserName.text = strName
        lblProductes.text = strProductList
    }
    
} //class
