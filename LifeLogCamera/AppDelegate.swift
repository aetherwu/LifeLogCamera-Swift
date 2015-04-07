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

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        application.idleTimerDisabled = true
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
        UIScreen.mainScreen().brightness = 0.5
    }
    
    func applicationWillTerminate(application: UIApplication) {
        UIScreen.mainScreen().brightness = 0.5
    }

}

