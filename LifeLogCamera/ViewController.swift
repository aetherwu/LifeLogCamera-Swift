//
//  ViewController.swift
//  LifeLogCamera
//
//  Created by Lex on 4/5/15.
//  Copyright (c) 2015 Mindlit. All rights reserved.
//

import UIKit
import CameraManager

class ViewController: UIViewController
{    
    let cm = CameraManager.sharedInstance
    var timer: NSTimer?
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        cm.cameraDevice = .Back
        cm.cameraOutputMode = .StillImage
        cm.cameraOutputQuality = .Low
        cm.flashMode = .Off
        cm.writeFilesToPhoneLibrary = true
    
        timer = NSTimer.scheduledTimerWithTimeInterval(
            30.0,
            target: self,
            selector: Selector("tick:"),
            userInfo: nil,
            repeats: true)
    }
    
    func tick(timer: NSTimer) {
        // Capture only when it's dimmed.
        if view.alpha != kMinimumAlpha {
            return
        }
        
        cm.resumeCaptureSession()
        cm.capturePictureWithCompletition {
            image, error in
            
            if self.respondsToSelector("uploadViaWiFi:") {
                NSThread.detachNewThreadSelector(Selector("uploadViaWiFi:"), toTarget: self, withObject: image)
            }
            
            self.cm.stopAndRemoveCaptureSession()
        }
    }

}

