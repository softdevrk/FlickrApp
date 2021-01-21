//
//  Bundler.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import Foundation

protocol BundlerProtocol {
    var apiUrl: String { get }
    var flickrApiKey: String { get }
}

class Bundler: BundlerProtocol {
    private let serverUrlKey = "API_URL"
    private let flickrTokenKey = "FLICKR_API_KEY"
    private let bundle: Bundle
    
    init(bundle: Bundle) {
        self.bundle = bundle
    }
    
    var apiUrl: String {
        return string(forKey: serverUrlKey)
    }
    
    var flickrApiKey: String {
        return string(forKey: flickrTokenKey)
    }
    
    func string(forKey key: String) -> String {
        return bundle.object(forInfoDictionaryKey: key) as? String ?? ""
    }
}
