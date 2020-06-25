//
//  VMZPersonViewController.swift
//  StarWarsApi_objc
//
//  Created by Victor Monteiro on 6/25/20.
//  Copyright © 2020 Atomuz. All rights reserved.
//

import UIKit

class VMZPersonViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personHeight: UILabel!
    //MARK: - Variables
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
       initialSetup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       animationSetup()
    }
    
    //MARK: Methods
    func updateView(person: VMZPerson?) {
        guard let person = person else { return }
        self.personHeight.isHidden = false
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.personNameLabel.text = person.name
            self.personNameLabel.alpha = 1
        }, completion: nil)
        personHeight.text = person.height
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func initialSetup() {
         self.personNameLabel.alpha = 0
        self.personHeight.isHidden = true
         self.personNameLabel.font = UIFont.systemFont(ofSize: 16)
    }
    
    func animationSetup() {
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat], animations: {
               self.personNameLabel.text = "Star Wars"
                     self.personNameLabel.alpha = 1
            self.personNameLabel.font = UIFont.systemFont(ofSize: 32)
        }, completion: nil)
        
        
    }
}
extension VMZPersonViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        VMZPersonController.fetchPerson(withName: searchTerm) { (person) in
            DispatchQueue.main.async {
                 self.updateView(person: person)
            }
        }
    }
}
