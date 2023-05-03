//
//  ViewController.swift
//  Lesson 3.1
//
//  Created by Иван on 03.05.2023.
//

import UIKit
import SpringAnimation

final class AnimationViewController: UIViewController {
    // MARK: - Private IBOutlets
    @IBOutlet private weak var springView: SpringView!
    @IBOutlet private weak var presetLabel: UILabel!
    @IBOutlet private weak var curveLabel: UILabel!
    @IBOutlet private weak var forceLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var delayLabel: UILabel!
    @IBOutlet private weak var buttonLabel: UIButton!
    
    // MARK: - Private properties
    private let animations = Animation.getAnimation()

    // MARK: - Private IB Actions
    @IBAction func startAnimation(_ sender: SpringButton) {
        guard let animation = animations.randomElement() else {
            return
        }
        springView.animation = animation.presetAnimation
        springView.curve = animation.curveAnimation
        springView.force = CGFloat(animation.forceAnimation)
        springView.duration = CGFloat(animation.durationAnimation)
        springView.delay = CGFloat(animation.delayAnimation)
        springView.animate()
        
        presetLabel.text = "preset: " + animation.presetAnimation
        curveLabel.text = "curve: " + animation.curveAnimation
        forceLabel.text = "force: " + String(format: "%.2f", animation.forceAnimation)
        durationLabel.text = "duration: " + String(format: "%.2f", animation.durationAnimation)
        delayLabel.text = "delay: " + String(format: "%.2f", animation.delayAnimation)
    }
}

