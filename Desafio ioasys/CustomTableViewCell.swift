//
//  CustomTableViewCell.swift
//  Desafio ioasys
//
//  Created by Lucas Feitosa on 22/10/20.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var customImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
