//
//  UIView+Animation.swift
//  SMToaster
//
//  Created by Sharkes Monken on 19/01/2020.
//

import Foundation

extension UIView {
    
    public enum SMAnimationEffect {
        case fadeIn
        case scaleIn
    }
    
    public func addAnimationEffect(_ effect: SMAnimationEffect) {
        switch effect {
        case .scaleIn:
            scaleInAnimation()
        default:
            fadeInAnimation()
        }
    }
    
    public func fadeInAnimation() {
        self.alpha = 0.0
        self.frame.origin.y += 10
        
        UIView.animate(withDuration: 0.8, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: .curveEaseIn, animations: {
            self.frame.origin.y -= 10
            self.alpha = 1.0
        }, completion: nil)
    }
    
    public func scaleInAnimation() {
        self.alpha = 0.0
        self.transform = .init(scaleX: 1.02, y: 1.02)
        
        UIView.animate(withDuration: 1.5, delay: 2, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseIn, animations: {
            self.transform = .identity
            self.alpha = 1.0
        }) { (_) in
        }
    }
}
