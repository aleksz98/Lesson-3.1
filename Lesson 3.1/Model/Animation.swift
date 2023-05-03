//
//  Animation.swift
//  Lesson 3.1
//
//  Created by Иван on 03.05.2023.
//

import CoreFoundation

struct Animation {
    let presetAnimation: String
    let curveAnimation: String
    let forceAnimation: CGFloat
    let durationAnimation: CGFloat
    let delayAnimation: CGFloat
    
    static func getAnimation() -> [Animation] {
        var animation = [Animation]()
        for _ in 0...animationsData.count {
            animation.append(Animation(
                presetAnimation: animationsData.randomElement() ?? "none",
                curveAnimation: curvesData.randomElement() ?? "none",
                forceAnimation: CGFloat(Float.random(in: 0.0...3.0)),
                durationAnimation: CGFloat(Float.random(in: 0.0...2.0)),
                delayAnimation: CGFloat(Float.random(in: 0.0...0.5))
            ))
        }
        return animation
    }
}
