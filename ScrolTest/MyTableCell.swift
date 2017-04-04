//
//  MyTableCell.swift
//  ScrolTest
//
//  Created by admin on 8 Nisan 5777.
//  Copyright © 5777 Matan alpha. All rights reserved.
//

import Foundation
import UIKit

class MyTableCell : UITableViewCell
{
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellLabel.sizeToFit()
      	}
}
