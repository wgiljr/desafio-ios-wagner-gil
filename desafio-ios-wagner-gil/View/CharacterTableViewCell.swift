//
//  CharacterTableViewCell.swift
//  desafio-ios-wagner-gil
//
//  Created by Wagner Gil Junior on 10/10/20.
//  Copyright © 2020 Wagner Gil Junior. All rights reserved.
//

import UIKit


class CharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgHeroCell: UIImageView!
    @IBOutlet weak var txtHeroName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        //setup()
    }
    
    func setup() {
        let view = loadViewFromNib()
        view.frame = bounds
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "CharacterTableViewCell", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    func configureCell(with character: MarvelHero){
        txtHeroName.text = character.name
        if let url = URL(string: character.thumbnail.getUrl()){
//            imgHeroCell.kf.indicatorType = .activity
            imgHeroCell.kf.setImage(with: url)
        } else {
            imgHeroCell.image = UIImage(named: "no_avatar")
        }
        imgHeroCell.layer.cornerRadius = imgHeroCell.frame.size.height / 2
//        imgHeroCell.layer.borderColor = UIColor(hex: "545263").cgColor
    }
}
