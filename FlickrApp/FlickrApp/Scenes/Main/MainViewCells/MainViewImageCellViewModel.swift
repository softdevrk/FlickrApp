//
//  MainViewImageCellViewModel.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import DomainPlatform

class MainViewImageCellViewModel {
    var url: URL?
    var withEffect: Bool
    
    init(flickrImage: FlickrImage, withEffect: Bool) {
        self.url = flickrImage.url
        self.withEffect = withEffect
    }
}
