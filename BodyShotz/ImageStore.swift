//
//  ImageStore.swift
//  BodyShotz
//
//  Created by Wayne Dahlberg on 2/4/17.
//  Copyright © 2017 PineBit Studios. All rights reserved.
//

import UIKit

class ImageStore {
    
    let cache = NSCache<NSString, UIImage>()
    
    // methods for adding, retrieving and deleting an image from the dictionary
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
        
        // create url for image
        let url = imageURL(forKey: key)
        
        // turn image into JPEG data
        if let data = UIImageJPEGRepresentation(image, 0.5) {
            // write it to full URL
            let _ = try? data.write(to: url, options: [.atomic])
        }
    }
    
    
    func image(forKey key: String) -> UIImage? {
        
        if let existingImage = cache.object(forKey: key as NSString) {
            return existingImage
        }
        
        let url = imageURL(forKey: key)
        guard let imageFromDisk = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        
        cache.setObject(imageFromDisk, forKey: key as NSString)
        return imageFromDisk
    }

    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
        
        // don't know if you'll get an error, so use try/catch within a do statement
        let url = imageURL(forKey: key)
        
        do {
            try FileManager.default.removeItem(at: url)
        } catch let deleteError {
            print("Error removing the image from disk: \(deleteError)")
        }
    }
    
    
    // MARK: - Saving Images
    
    func imageURL(forKey key: String) -> URL {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.appendingPathComponent(key)
    }
    
}
