//
//  TableViewCell.swift
//  Easy Chat
//
//  Created by Ishaan Sarna on 25/01/22.
//  Copyright © 2022 Ishaan Sarna. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var meAvatarImageView: UIImageView!
    @IBOutlet weak var youAvatarImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageView.layer.cornerRadius = messageView.frame.size.height/5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
