//
//  GetPetByIdModel.swift
//  XcodeGenTestApp
//
//  Created by Yamamoto Naoki on 2020/02/17.
//

import Foundation
import Petstore

protocol GetPetByIdModelInput {
    func getPetById(petId: Int,
                    completion: @escaping (_ result: Result<GetPetById.Response, Error>) -> Void)
}

final class GetPetByIdModel: GetPetByIdModelInput {
    func getPetById(petId: Int,
                    completion: @escaping (_ result: Result<GetPetById.Response, Error>) -> Void) {
        let targetType = GetPetById(petId)
        PetstoreApiProvider.shared.request(targetType, completion: completion)
    }
}
