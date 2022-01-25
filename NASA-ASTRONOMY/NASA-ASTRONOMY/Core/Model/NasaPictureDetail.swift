//
//  NasaPictureDetail.swift
//  NASA-ASTRONOMY
//
//  Created by Kapil Chandel on 24/01/22.
//

import Foundation

struct NasaPictureDetail :Codable, Equatable {
    public let date, explanation: String
    public let hdurl: String?
    public let mediaType, serviceVersion, title: String
    public let url: String
    var isCachedImage = false

    public enum CodingKeys: String, CodingKey {
        case date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
