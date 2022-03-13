//
//  BouncyYJ.swift
//  Buzzer Pro Max
//
//  Created by Jia Chen Yee on 13/3/22.
//

import Foundation
import UIKit

class BouncyYJ: UIView {
    var animator: UIDynamicAnimator!
    var collisions: UICollisionBehavior!
    var gravity: UIGravityBehavior!
    var dynamics: UIDynamicItemBehavior!
    
    var tappedOnYJ: (() -> Void)!
    var tappedOnZK: (() -> Void)!
    
    init(tappedOnYJ: @escaping (() -> Void), tappedOnZK: @escaping (() -> Void)) {
        super.init(frame: .zero)
        
        self.tappedOnYJ = tappedOnYJ
        self.tappedOnZK = tappedOnZK
        
        animator = UIDynamicAnimator(referenceView: self)
        collisions = UICollisionBehavior(items: [])
        collisions.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisions)
        
        gravity = UIGravityBehavior(items: [])
        animator.addBehavior(gravity)
        
        dynamics = UIDynamicItemBehavior(items: [])
        dynamics.elasticity = 1.05
        dynamics.resistance = 0
        dynamics.friction = 0
        animator.addBehavior(dynamics)
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.insert(imageName: ["ZK", "ZK", "ZK", "YJ"].randomElement()!)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func insert(imageName: String) {
        let imageWidth = 100.0
        
        let randX = drand48() * (Double(bounds.width) - imageWidth)
        let randY = drand48() * (Double(bounds.height) - imageWidth)
        let imageButton = UIButton(frame: CGRect(x: randX, y: randY, width: imageWidth, height: imageWidth))
        
        imageButton.setImage(UIImage(named: imageName), for: .normal)
        imageButton.layer.cornerRadius = imageWidth / 2
        imageButton.layer.borderWidth = 4
        
        imageButton.clipsToBounds = true
        
        addSubview(imageButton)
        
        collisions.addItem(imageButton)
        dynamics.addItem(imageButton)
        
        let push = UIPushBehavior(items: [imageButton], mode: .instantaneous)
        push.angle = CGFloat(drand48() * .pi * 2)
        push.magnitude = CGFloat(1 + drand48() * 2)
        
        animator.addBehavior(push)
        
        let despawn = {
            imageButton.removeFromSuperview()
            push.removeItem(imageButton)
            self.dynamics.removeItem(imageButton)
            self.collisions.removeItem(imageButton)
        }
        
        imageButton.layer.borderColor = (imageName == "YJ" ? UIColor.systemGreen : UIColor.systemRed).cgColor
        
        imageButton.addAction(UIAction { [self] _ in
            imageName == "YJ" ? self.tappedOnYJ() : self.tappedOnZK()
            despawn()
        }, for: .touchUpInside)
        
        UIView.animate(withDuration: 5,
                       delay: 0,
                       options: [.repeat, .autoreverse, .allowUserInteraction],
                       animations: {
            imageButton.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
        
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            UIView.animate(withDuration: 1, delay: 0, options: .allowUserInteraction) {
                imageButton.alpha = 0
            } completion: { _ in
                despawn()
            }
        }
    }
}
