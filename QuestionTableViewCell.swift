//
//  QuestionTableViewCell.swift
//  IOSTodoTest
//
//  Created by Carlos Salas on 23/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var questionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
