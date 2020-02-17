//
//  PetTableViewController.swift
//  XcodeGenTestApp
//
//  Created by Yamamoto Naoki on 2020/02/17.
//

import UIKit

class PetTableViewController: UITableViewController {
    var presenter: PetPresenterInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: 外からinjectする
        inject(PetPresenter(self))
    }
    
    func inject(_ presenter: PetPresenterInput) {
        self.presenter = presenter
    }
}

// MARK: - TableViewDelegate

extension PetTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRowAt(indexPath: indexPath)
    }
}

extension PetTableViewController: PetPresenterOutput {
    func transitionToGetPetById() {
        perform(segue: StoryboardSegue.Pet.toGetPetById)
    }
}
