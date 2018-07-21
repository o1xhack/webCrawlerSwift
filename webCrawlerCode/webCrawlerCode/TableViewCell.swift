//
//  TableViewCell.swift
//  webCrawlerCode
//
//  Created by wyx on 2018/7/21.
//  Copyright © 2018 LifeAnalysis Lab. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var testLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
