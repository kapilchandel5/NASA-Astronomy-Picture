//
//  NasaPictureDetailUseCase.swift
//  NASA-ASTRONOMY
//
//  Created by Kapil Chandel on 24/01/22.
//

import Foundation

enum NasaPictureType {
    case dayPicture
    
    func getKey() -> String {
        return "api_key"
    }
}

protocol NasaPictureDetailUseCaseProtocol {
    func getNasaPictureDetails(from pictureType: NasaPictureType, completion: @escaping (Result<NasaPictureDetail, APIError>) -> Void)
}

class NasaPictureDetailUseCase: NasaPictureDetailUseCaseProtocol {
    
    let nasaPictureNetwork:NasaPictureNetworkProtocol
    
    init() {
        nasaPictureNetwork = NasaPictureNetwork(configuration: .default)
    }
    
    func getNasaPictureDetails(from pictureType: NasaPictureType, completion: @escaping (Result<NasaPictureDetail, APIError>) -> Void) {
        let key = shortStringValueInYYYYMMDDAsDate(Date()) ?? ""
        nasaPictureNetwork.fetch(for: pictureType) { (result : Result<NasaPictureDetail, APIError>) in
            switch result {
            case .success(let res):
                DataCache.instance.cleanAll()
                do {
                    try DataCache.instance.write(codable: res, forKey: key)
                } catch {
                    completion(.failure(.responseUnsuccessful))
                }
                
                completion(.success(res))
            case .failure(_):
                do {
                    if let cachedPictureOfDay:NasaPictureDetail = try? DataCache.instance.readCodable(forKey: key) {
                        completion(.success(cachedPictureOfDay))
                    } else {
                        let lastDayKey = shortStringValueInYYYYMMDDAsDayBeforeDate(Date()) ?? ""
                        guard let cachePictureOfDayModel: NasaPictureDetail = try DataCache.instance.readCodable(forKey: lastDayKey) else {
                            completion(.failure(.responseUnsuccessful))
                            return
                        }
                        completion(.success(cachePictureOfDayModel))
                        completion(.failure(.lastCachedReponse))
                    }
                } catch {
                    completion(.failure(.responseUnsuccessful))
                }
            }
        }
    }
}


