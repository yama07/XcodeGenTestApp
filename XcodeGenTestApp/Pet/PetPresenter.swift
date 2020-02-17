//
//  PetPresenter.swift
//  XcodeGenTestApp
//
//  Created by Yamamoto Naoki on 2020/02/17.
//

import Foundation

protocol PetPresenterInput {
    func didSelectRowAt(indexPath: IndexPath)
}

protocol PetPresenterOutput: AnyObject {
    func transitionToGetPetById()
}

final class PetPresenter: PetPresenterInput {
    private weak var view: PetPresenterOutput!
    
    init(_ view: PetPresenterOutput) {
        self.view = view
    }
    
    func didSelectRowAt(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            view?.transitionToGetPetById()
        default:
            assertionFailure("想定外のセルが選択されました。")
        }
    }
}
