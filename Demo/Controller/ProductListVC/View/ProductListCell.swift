//
//  ProductListCell.swift
//  Demo
//
//  Created by Shashikant's_Macmini on 26/02/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit

final class ProductListCell: UITableViewCell {

    // MARK:- Outlets
    @IBOutlet weak var lblProducteName: UILabel!
    
    // MARK:- Default Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


} //class
