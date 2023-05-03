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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let animation = getRandomAnimation()
        updateLabels(for: animation)
    }
    
    // MARK: - Private IB Actions
    @IBAction func startAnimation(_ sender: SpringButton) {
        let animation = getRandomAnimation()
        springView.animation = animation.presetAnimation
        springView.curve = animation.curveAnimation
        springView.force = CGFloat(animation.forceAnimation)
        springView.duration = CGFloat(animation.durationAnimation)
        springView.delay = CGFloat(animation.delayAnimation)
        springView.animate()
        
        updateLabels(for: animation)
    }
    
    private func getRandomAnimation() -> Animation {
        guard let animation = animations.randomElement() else {
            fatalError("No Animation")
        }
        return animation
    }
    
    private func updateLabels(for animation: Animation) {
        presetLabel.text = getAnimationLabelText(
            for: "preset", animation.presetAnimation)
        curveLabel.text = getAnimationLabelText(
            for: "curve", animation.curveAnimation)
        forceLabel.text = getAnimationLabelText(
            for: "force", String(format: "%.2f", animation.forceAnimation))
        durationLabel.text = getAnimationLabelText(
            for: "duration", String(format: "%.2f", animation.durationAnimation))
        delayLabel.text = getAnimationLabelText(
            for: "delay", String(format: "%.2f", animation.delayAnimation))
    }
    
    private func getAnimationLabelText(for label: String, _ value: String) -> String {
        return "\(label): \(value)"
    }
}

