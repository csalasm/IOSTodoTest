//
//  TestTableViewCell.swift
//  IOSTodoTest
//
//  Created by INFTEL 23 on 22/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
