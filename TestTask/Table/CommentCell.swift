//
//  CommentCell.swift
//  TestTask
//
//  Created by Артем Шпилька on 27.06.19.
//  Copyright © 2019 Артем Шпилька. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var postId: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var body: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
