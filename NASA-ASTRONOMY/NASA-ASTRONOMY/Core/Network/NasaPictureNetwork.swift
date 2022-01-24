//
//  NasaPictureNetwork.swift
//  NASA-ASTRONOMY
//
//  Created by Kapil Chandel on 24/01/22.
//

import Foundation

public enum APIError: Error {
    case responseUnsuccessful
    case invalidData
    case requestFailed
    case jsonParsingFailure
    case lastCachedReponse
    
    var localizedDescription: String {
        switch self {
        case .responseUnsuccessful: return "Unsuccessful response"
        case .invalidData: return "Invalid data"
        case .requestFailed: return "Request failed"
        case .jsonParsingFailure: return "JSON parsing failed"
        case .lastCachedReponse: return "last cached response"
        }
    }
}

protocol NasaPictureNetworkProtocol {
    func fetch<T: Codable>(for pictureType: NasaPictureType, completion: @escaping (Result<T, APIError>) -> ())
}

class NasaPictureNetwork: NasaPictureNetworkProtocol {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    func fetch<T:Codable>(for pictureType: NasaPictureType, completion: @escaping (Result<T, APIError>) -> ()) {
        let request = getRequest(for: pictureType)
        
        let task =  session.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed))
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(genericModel))
                    } catch {
                        completion(.failure(.jsonParsingFailure))
                    }
                } else {
                    completion(.failure(.invalidData))
                }
            } else {
                completion(.failure(.responseUnsuccessful))
            }
        }
        task.resume()
    }
    
    private func getRequest(for pictureType: NasaPictureType) -> URLRequest {
        var components = URLComponents(string: APIConstant.url)
        switch pictureType {
        case .dayPicture:
            let key = pictureType.getKey()
            components?.queryItems = [URLQueryItem(name: key, value: APIConstant.key)]
        }
        let url = components?.url ??  URL(string: APIConstant.url)!
        return URLRequest(url: url)
    }
    
}


