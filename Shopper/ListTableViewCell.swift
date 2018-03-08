//
//  ListCollectionViewCell.swift
//  Shopper
//
//  Created by Apple on 03/03/18.
//  Copyright © 2018 Abhilash. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var addButton: UIButton?
    override func awakeFromNib() {
        super.awakeFromNib()
        addButton?.tintColor = .orange
        titleView.dropShadow()
    }
    func configureCell(modelObj: ItemListViewModel) {
        selectionStyle = .none
        itemImageView.image = UIImage(named: modelObj.itemImage)
        titleLabel.text = modelObj.itemTitle
        amountLabel.text = "\(modelObj.itemAmount)" + " \(modelObj.itemCurrency)"
        quantityLabel.text = "Quantity: " + "\(modelObj.itemQuantity)"
        
    }
}

