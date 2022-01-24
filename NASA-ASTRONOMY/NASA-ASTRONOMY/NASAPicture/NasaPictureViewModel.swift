//
//  NasaPictureViewModel.swift
//  NASA-ASTRONOMY
//
//  Created by Kapil Chandel on 24/01/22.
//

import Foundation

class NasaPictureViewModel {
    
    let usecase: NasaPictureDetailUseCaseProtocol
    
    init(){
        usecase = NasaPictureDetailUseCase()
        getNasaPicture()
    }
    
    var responseCallBack : ((NasaPictureDetail) -> Void)?
    var alertCallBack : ((APIError) -> Void)?
    
    private func getNasaPicture() {
        usecase.getNasaPictureDetails(from: .dayPicture) { [weak self] result in
            // executing result on main thread
            DispatchQueue.main.async {
                switch result {
                case.success(let detail) : self?.responseCallBack?(detail)
                case .failure(let error): self?.alertCallBack?(error)
                }
            }
        }
    }
}
