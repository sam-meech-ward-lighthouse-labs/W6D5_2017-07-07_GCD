//
//  Photo.swift
//  GCDDemo
//
//  Created by Sam Meech-Ward on 2017-07-07.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

import Foundation

class Photo {
    
    private var likes = 0
    
    private let likesQueue = DispatchQueue(label: "com.meech-ward.lock-likes", qos: .default, attributes: [.concurrent])
    
    func incrementLikes() {
        likesQueue.async(flags: .barrier) {
            self.likes += 1
        }
    }
    
    func getLikes() -> Int {
        var tmp = 0
        likesQueue.sync {
            tmp = likes
        }
        return tmp
    }
    
    
    func process() {
        let random = arc4random_uniform(2)+2
        sleep(random)
    }
}
