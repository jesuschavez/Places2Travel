//
//  ChartsTableViewCell.swift
//  SearchBarTableView
//
//  Created by jesuschvz on 12/14/17.
//  Copyright © 2017 mextech. All rights reserved.
//

import UIKit

class ChartsTableViewCell: UITableViewCell {

    // MARK: - When Cell Loads
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    // MARK: - Outlets
    
 
    @IBOutlet weak var numbersLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingsLabel: UILabel!
    
}
