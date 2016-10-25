//
//  DropDownCell.swift
//  Yelp
//
//  Created by Harsh Trivedi on 10/24/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class DropDownCell: UITableViewCell {

    @IBOutlet weak var dropDownCellLabel: UILabel!
    
    
    @IBOutlet weak var dropDownCellImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dropDownCellLabel.text = "Categories";
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(image: UIImage)
    {
    }

}
