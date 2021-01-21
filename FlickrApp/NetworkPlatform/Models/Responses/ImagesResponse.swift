//
//  ImagesResponse.swift
//  NetworkPlatform
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import Foundation

public struct FlickrImagesResponse: Decodable {
    public var photos: ImagesResponse
}

public struct ImagesResponse: Decodable {
    public var photo: [ImageResponse]
}

public struct ImageResponse: Decodable {
    private var id: String
    private var secret: String
    private var server: String
    private var farm: Int
    private var title: String
    
    public var photoLink: String {
        return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
    }
}
