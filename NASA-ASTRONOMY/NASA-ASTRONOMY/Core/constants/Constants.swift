//
//  Constants.swift
//  NASA-ASTRONOMY
//
//  Created by Kapil Chandel on 24/01/22.
//

import Foundation

struct Alert {
    static let title = "Error"
    static let defaultMessage = "Something went wrong, please check your internet connection and restart App"
    static let cachedMessage = "We are not connected to the internet, showing you the last image we have."
    static let buttonTitle = "ok"
}

struct APIConstant {
    static let key = "L6imfy0jFngWM4A3zA33xFBwhruOlmd4Kgt7I3rv"
    static let url = "https://api.nasa.gov/planetary/apod"
    static let completeUrl = "https://api.nasa.gov/planetary/apod?api_key=L6imfy0jFngWM4A3zA33xFBwhruOlmd4Kgt7I3rv"
}

