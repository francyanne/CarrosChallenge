//
//  Animation.swift
//  AppCarrosChallenge
//
//  Created by Fran Martins on 31/10/22.
//

import Foundation
import Lottie

struct ProgressView {
    // MARK: Properties
    var animationView = AnimationView()
    
    // MARK: Methods
    func startAnimation(animation: String, frame: CGRect, center: CGPoint) {
        animationView.animation = Animation.named(animation)
        animationView.isHidden = false
        animationView.frame = frame
        animationView.backgroundColor = .white
        animationView.contentMode = .scaleAspectFit
        animationView.center = center
        animationView.loopMode = .loop
        animationView.play()
    }
    
    func stopAnimation() {
        animationView.stop()
        animationView.removeFromSuperview()
    }
}
