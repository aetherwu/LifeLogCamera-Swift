//
//  ViewController+Brightness.swift
//  LifeLogCamera
//
//  Created by Lex Tang on 4/7/15.
//  Copyright (c) 2015 Mindlit. All rights reserved.
//

import UIKit

let kMinimumAlpha: CGFloat = 0.1

extension ViewController
{    
    var brightness: CGFloat {
        get {
            return UIScreen.mainScreen().brightness
        }
        set {
            view.alpha = max(kMinimumAlpha, newValue) // In order to make it touchable
            UIScreen.mainScreen().brightness = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doubleTap = UITapGestureRecognizer(target: self, action: Selector("didDoubleTap:"))
        doubleTap.numberOfTapsRequired = 2
        doubleTap.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(doubleTap)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        brightness = 0.5
    }
    
    func didDoubleTap(gesture: UITapGestureRecognizer) {
        brightness = brightness != 0 ? 0 : 0.5
    }
}