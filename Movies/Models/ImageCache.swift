//
//  ImageCache.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import UIKit

class ImageCache {

    private let cache = NSCache<NSString, UIImage>()

    func setImage(_ image: UIImage, forKey key: URL) {
        cache.setObject(image, forKey: key.absoluteString as NSString)
    }

    func image(forKey key: URL) -> UIImage? {
        return cache.object(forKey: key.absoluteString as NSString)
    }

    func deleteImage(forKey key: URL) {
        cache.removeObject(forKey: key.absoluteString as NSString)
    }

}
