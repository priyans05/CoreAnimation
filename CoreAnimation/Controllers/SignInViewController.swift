//
//  ViewController.swift
//  CoreAnimation
//
//  Created by PRIYANS on 1/4/19.
//  Copyright © 2019 PRIYANS. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    //MARK: Appearance
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: View Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        signInButton.round(cornerRadius: 10, borderWidth: 3.0, borderColor: UIColor.white)
//        titleLabel.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fadeInViews()
        animateButtonWithSpring()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: USer Action
    
    @IBAction func signInButtonClicked(_ sender: UIButton) {
        
    }
    
    //MARK: Animation
    
    func fadeInViews() {
        let fade = AnimationHelper.basicFadeAnimation()
        titleLabel.layer.add(fade, forKey: nil)
        
        fade.beginTime = AnimationHelper.addDelay(time: 1.0)
        userNameField.layer.add(fade, forKey: nil)
        
        fade.beginTime = AnimationHelper.addDelay(time: 2.0)
        passwordField.layer.add(fade, forKey: nil)
    }

    
    func animateButtonWithSpring() {
        let moveUp = CASpringAnimation(keyPath: AnimationHelper.posY)
        moveUp.fromValue = signInButton.layer.position.y + AnimationHelper.screenBounds.height
        moveUp.toValue = signInButton.layer.position.y
        moveUp.duration = moveUp.settlingDuration
        moveUp.beginTime = AnimationHelper.addDelay(time: 2.5)
        moveUp.fillMode = CAMediaTimingFillMode.backwards
        
        //Spring Physics Propertities
        moveUp.initialVelocity = 5
        moveUp.mass = 1
        moveUp.stiffness = 75
        moveUp.damping = 12
        
        signInButton.layer.add(moveUp, forKey: nil)
        
    }
}

//MARK: Delegation Extension

