//
//  CharacterDetailsViewController.swift
//  desafio-ios-wagner-gil
//
//  Created by Wagner Gil Junior on 03/08/20.
//  Copyright © 2020 Wagner Gil Junior. All rights reserved.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageViewHero: UIImageView!
    @IBOutlet weak var labelHeroName: UILabel!
    @IBOutlet weak var labelHeroDescription: UILabel!
    
    var selectedCharacter: MarvelHero?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let character = selectedCharacter{
            labelHeroName.text = character.name
            if let url = URL(string: character.thumbnail.getUrl()){
                imageViewHero.kf.indicatorType = .activity
                imageViewHero.kf.setImage(with: url)
            } else {
                imageViewHero.image = UIImage(named: "no_avatar")
            }
            labelHeroDescription.text = !character.description.isEmpty ? character.description : "Personagem sem Descrição."
        }
    }
}
