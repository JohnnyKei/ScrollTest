//
//  FullImageTableViewCell.swift
//  ScrollTest
//
//  Created by kei on 2015/02/22.
//  Copyright (c) 2015年 kei. All rights reserved.
//

import UIKit

class FullImageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView?.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
    }

}


