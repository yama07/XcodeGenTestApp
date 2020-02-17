//
//  GetPetByIdViewController.swift
//  XcodeGenTestApp
//
//  Created by Yamamoto Naoki on 2020/02/17.
//

import Petstore
import PKHUD
import UIKit

class GetPetByIdViewController: UIViewController {
    @IBOutlet weak var petIdTextField: UITextField!
    @IBOutlet weak var responseTextView: UITextView!
    
    private var presenter: GetPetByIdPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: 外からinjectする
        inject(GetPetByIdPresenter(view: self, model: GetPetByIdModel()))
    }
    
    private func inject(_ presenter: GetPetByIdPresenterInput) {
        self.presenter = presenter
    }
}

// MARK: - GetPetByIdPresenterOutput

extension GetPetByIdViewController: GetPetByIdPresenterOutput {
    func updateResponse(_ pet: Pet) {
        responseTextView?.text = String(describing: pet)
    }
    
    func errorOccured(_ error: Error) {
        responseTextView?.text = error.localizedDescription
    }
    
    func progressDidStart() {
        HUD.show(.progress)
    }
    
    func progressDidFinish() {
        HUD.hide()
    }
}

// MARK: - IBAction

extension GetPetByIdViewController {
    @IBAction func didTapRequestButton(_ sender: Any) {
        presenter.didTapRequestButton(petIdText: petIdTextField?.text)
    }
}
