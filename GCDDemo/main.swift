//
//  main.swift
//  GCDDemo
//
//  Created by Sam Meech-Ward on 2017-07-07.
//  Copyright © 2017 Sam Meech-Ward. All rights reserved.
//

import Foundation

print("App starts running")

let photo = Photo()

//let queue = DispatchQueue.global(qos: .default)
let queue = DispatchQueue(label: "com.meech-ward.process-image", qos: .default, attributes: [.concurrent])

//let group = DispatchGroup()
//
//for i in 1...5 {
//    group.enter()
//    
//    queue.async {
//        photo.process()
//        print("Image processed \(i)")
//        
//        group.leave()
//    }
//}
//
//group.notify(queue: queue) {
//    DispatchQueue.main.async {
//        print("All images processed")
//    }
//}


let group = DispatchGroup()

for i in 1...10000 {
    group.enter()
    queue.async {
        photo.incrementLikes()
        group.leave()
    }
}

group.notify(queue: queue) {
    DispatchQueue.main.async {
        print("photo likes: \(photo.getLikes())")
    }
}



print("App continues running")


RunLoop.main.run(until: Date(timeIntervalSinceNow: 100))
