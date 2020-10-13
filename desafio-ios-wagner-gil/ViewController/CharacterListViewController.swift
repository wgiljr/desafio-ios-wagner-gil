//
//  ViewController.swift
//  desafio-ios-wagner-gil
//
//  Created by Wagner Gil Junior on 03/08/20.
//  Copyright © 2020 Wagner Gil Junior. All rights reserved.
//

import UIKit

class CharacterListViewController: UITableViewController {
    var heroes: [MarvelHero] = []
    var loadingHeroes = false
    var currentPage = 0
    var total = 0
    var selectedCharacter: MarvelHero? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadHeroes()
        configureNib()
        
    }
    
    fileprivate func configureNib(){
        let nibName = UINib(nibName: "CharacterTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "characterCell")
    }
    
    func loadHeroes() {
        loadingHeroes = true
        MarvelAPI.loadCharacters(page: currentPage) { (info) in
            if let info = info {
                self.heroes += info.data.results
                self.total = info.data.total
                DispatchQueue.main.async {
                    self.loadingHeroes = false
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let vc = segue.destination as! Chara
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterTableViewCell
        cell.configureCell(with: heroes[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCharacter = self.heroes[indexPath.row]
        self.performSegue(withIdentifier: "heroSegue", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == heroes.count - 10 && !loadingHeroes && heroes.count != total {
            currentPage += 1
            loadHeroes()
        }
    }


}

