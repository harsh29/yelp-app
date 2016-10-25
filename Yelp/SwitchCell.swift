//
//  SwitchCell.swift
//  Yelp
//
//  Created by Harsh Trivedi on 10/24/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: class
{
    func switchTableViewCell(_ switchTableViewCell: SwitchCell, valueChanged isOn: Bool)
}

class SwitchCell: UITableViewCell {

    @IBOutlet weak var switchLabel: UILabel!
    
    @IBOutlet weak var filterAppliedSwitch: UISwitch!
    
    weak var delegate: SwitchTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func onSwitchValueChanged(_ sender: UISwitch)
    {
        delegate?.switchTableViewCell(self, valueChanged: filterAppliedSwitch.isOn)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // Set the cell contents based on the specified parameters.
    func setData(labelText: String?, isOn : Bool?, delegate: SwitchTableViewCellDelegate?)
    {
        switchLabel.text = labelText
        filterAppliedSwitch.isOn = isOn ?? false
        self.delegate = delegate
    }

}
