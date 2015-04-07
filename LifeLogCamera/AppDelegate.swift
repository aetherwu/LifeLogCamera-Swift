//
//  AppDelegate.swift
//  LifeLogCamera
//
//  Created by Lex on 4/5/15.
//  Copyright (c) 2015 Mindlit. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var originalBrightness: CGFloat = 0.01

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        application.idleTimerDisabled = true
        return true
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        originalBrightness = UIScreen.mainScreen().brightness
        UIScreen.mainScreen().brightness = 0.01
    }
    
    func applicationWillResignActive(application: UIApplication) {
        UIScreen.mainScreen().brightness = originalBrightness
    }
    
    func applicationWillTerminate(application: UIApplication) {
        UIScreen.mainScreen().brightness = originalBrightness
    }

}

