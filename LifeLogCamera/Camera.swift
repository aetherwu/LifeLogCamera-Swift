//
//  Camera.swift
//  LifeLogCamera
//
//  Created by Lex on 4/6/15.
//  Copyright (c) 2015 Mindlit. All rights reserved.
//

import UIKit
import AVFoundation

class Camera: NSObject
{
    let session: AVCaptureSession = {
        let s = AVCaptureSession()
        s.sessionPreset = AVCaptureSessionPreset640x480
        return s
    }()
    
    let input: AVCaptureDeviceInput = {
        var backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        if backCamera.lockForConfiguration(nil) {
            backCamera.focusMode = AVCaptureFocusMode.ContinuousAutoFocus
            backCamera.unlockForConfiguration()
        }
        
        let inputDevice = AVCaptureDeviceInput(device: backCamera, error: nil)
        return inputDevice
    }()
    
    let output: AVCaptureStillImageOutput = {
        let o = AVCaptureStillImageOutput()
        o.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
        return o
    }()
    
    func shot(complitionHandler: (NSData? -> Void)!) {
        if session.canAddInput(input) {
            session.addInput(input)
        }
        
        if session.canAddOutput(output) {
            session.beginConfiguration()
            session.addOutput(output)
            session.commitConfiguration()
            session.startRunning()
            
            if let connection = output.connectionWithMediaType(AVMediaTypeVideo) {
                output.captureStillImageAsynchronouslyFromConnection(connection) {
                    sampleBuffer, error in
                    println(error)
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    complitionHandler(imageData)
                }
            }
        }
    }
    
    func unload() {
        session.stopRunning()
        session.removeOutput(output)
        session.removeInput(input)
    }
}
