//
//  FlickrImage.swift
//  DomainPlatform
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import NetworkPlatform

public struct FlickrImage {
    private let photoLink: String
    
    public var url: URL? {
        return URL(string: photoLink)
    }
    
    init(imageResponse: ImageResponse) {
        self.photoLink = imageResponse.photoLink
    }
}
