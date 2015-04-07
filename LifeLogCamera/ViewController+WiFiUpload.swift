//
//  ViewController+WiFiUpload.swift
//  LifeLogCamera
//
//  Created by Lex Tang on 4/7/15.
//  Copyright (c) 2015 Mindlit. All rights reserved.
//

import UIKit
import SystemConfiguration

extension ViewController
{
    // @see http://stackoverflow.com/questions/25623272/working-with-c-structs-in-swift
    func wifiReachable() -> Bool {
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0)).takeRetainedValue()
        }
        
        var flags: SCNetworkReachabilityFlags = 0
        if SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) == 0 {
            return false
        }
        
        let isReachable = (flags & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let wifiConnection = (flags & UInt32(kSCNetworkReachabilityFlagsIsWWAN)) != 0
        return (isReachable && !needsConnection && !wifiConnection)
    }
    
    func uploadViaWiFi(image: UIImage) {
        if wifiReachable() {
            let uploadURL = NSURL(string: "")! // TODO: Fill in our server address
            if uploadURL.absoluteString == "" {
                return
            }
            var request = NSURLRequest(
                URL: uploadURL,
                cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData,
                timeoutInterval: 20)
            let data = UIImageJPEGRepresentation(image, 0.8)
            NSURLSession.sharedSession().uploadTaskWithRequest(request, fromData: data)
        }
    }
}
