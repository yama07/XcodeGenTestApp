//
//  GetPetByIdPresenter.swift
//  XcodeGenTestApp
//
//  Created by Yamamoto Naoki on 2020/02/17.
//

import Foundation
import Petstore

protocol GetPetByIdPresenterInput {
    func didTapRequestButton(petIdText: String?)
}

protocol GetPetByIdPresenterOutput: AnyObject {
    func updateResponse(_ pet: Pet)
    func errorOccured(_ error: Error)
    func progressDidStart()
    func progressDidFinish()
}

final class GetPetByIdPresenter: GetPetByIdPresenterInput {
    private weak var view: GetPetByIdPresenterOutput?
    private var model: GetPetByIdModelInput
    
    init(view: GetPetByIdPresenterOutput, model: GetPetByIdModelInput) {
        self.view = view
        self.model = model
    }
    
    func didTapRequestButton(petIdText: String?) {
        view?.progressDidStart()
        guard let petIdText = petIdText,
            let petId = Int(petIdText) else {
            view?.progressDidFinish()
            return
        }
        
        log.debug("Start getPetBuid request.")
        model.getPetById(petId: petId) { [weak self] result in
            switch result {
            case let .success(pet):
                log.debug("Request succeeded.: \(pet)")
                self?.view?.updateResponse(pet)
            case let .failure(error):
                log.debug("Request failed.: \(error.localizedDescription)")
                self?.view?.errorOccured(error)
            }
            self?.view?.progressDidFinish()
        }
    }
}
