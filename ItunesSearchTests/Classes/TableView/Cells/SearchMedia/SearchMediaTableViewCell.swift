//
//  SearchMediaTableViewCell.swift
//  ItunesSearchTests
//
//  Created by Тимур Шафигуллин on 07.04.2018.
//  Copyright © 2018 iOSLab. All rights reserved.
//

import UIKit

class SearchMediaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        mediaImageView.layer.cornerRadius = mediaImageView.frame.size.width / 2
        mediaImageView.clipsToBounds = true
    }
    
    func prepareCell(with cellModel: SearchMediaCellModel) {
        nameLabel.text = cellModel.name
        authorLabel.text = cellModel.author
        priceLabel.text = "Price: \(cellModel.price)"
        descriptionLabel.text = cellModel.description
    }
    
    
}
