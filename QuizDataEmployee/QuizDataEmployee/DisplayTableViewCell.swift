//
//  DisplayTableViewCell.swift
//  QuizDataEmployee
//
//  Created by Muhammad Hilmy Fauzi on 27/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelNAME: UILabel!
    @IBOutlet weak var labelSTAFF: UILabel!
    @IBOutlet weak var labelGOLONGAN: UILabel!
    @IBOutlet weak var labelSALARY: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
