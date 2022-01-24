//
//  UIImageView+Download.swift
//  NASA-ASTRONOMY
//
//  Created by Kapil Chandel on 24/01/22.
//
import Foundation
import UIKit

let mimeType = "image"

extension UIImageView {
    func downloaded(from url: String?) {
        guard let urlValue = url, let url = URL(string: urlValue) else { return }
        
        let key = (shortStringValueInYYYYMMDDAsDate(Date()) ?? "") + mimeType
        
        if DataCache.instance.hasData(forKey: key) {
            let cacheImage = DataCache.instance.readImageForKey(key: key)
            DispatchQueue.main.async {
                self.image = cacheImage
            }
            
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix(mimeType),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                else { return }
                DataCache.instance.write(image: image, forKey: key)
                DispatchQueue.main.async {
                    self.image = image
                }
            }.resume()
        }
    }
}
