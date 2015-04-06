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
    let camera: Camera = {
        let c = Camera()
        return c
        }()


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        camera.shot {
            imageData in
            println(imageData)
        }
        
        UIApplication.sharedApplication().setKeepAliveTimeout(605) {
            
        }
    }

}

