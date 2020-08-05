//
//  CharacterListViewCell.swift
//  desafio-ios-wagner-gil
//
//  Created by Wagner Gil Junior on 05/08/20.
//  Copyright © 2020 Wagner Gil Junior. All rights reserved.
//

import UIKit
import Kingfisher

class CharacterListViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewThumb: UIImageView!
    @IBOutlet weak var labelHeroName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func prepareCell(with character: MarvelHero) {
        labelHeroName.text = character.name
        if let url = URL(string: character.thumbnail.getUrl()){
            imageViewThumb.kf.indicatorType = .activity
            imageViewThumb.kf.setImage(with: url)
        } else {
            imageViewThumb.image = UIImage(named: "no_avatar")
        }
        imageViewThumb.layer.cornerRadius = imageViewThumb.frame.size.height / 2
    }
}
