//
//  MyTableViewCell.swift
//  TimeManager
//
//  Created by Мария Хныкина on 29.09.2022.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myLable: UILabel!
    static let id = "MyTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
