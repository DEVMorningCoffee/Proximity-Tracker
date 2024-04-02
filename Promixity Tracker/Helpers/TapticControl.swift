//
//  TapticControl.swift
//  Promixity Tracker
//
//  Created by user238598 on 4/2/24.
//


import Foundation
import SwiftUI

#if !os(watchOS)
import AudioToolbox
#endif


/// Plays a long vibration on the taptic engine.
func longVibration () -> () {
    DispatchQueue.global(qos: .userInteractive).async {
        
#if !os(watchOS)
        AudioServicesPlayAlertSoundWithCompletion(SystemSoundID(kSystemSoundID_Vibrate)) { }
#else
        WKInterfaceDevice.current().play(.success)
#endif
    }
}


/// Plays a medium vibration on the taptic engine.
func mediumVibration () -> () {
    
    DispatchQueue.global(qos: .userInteractive).async {
#if !os(watchOS)
        let impactMed = UIImpactFeedbackGenerator(style: .medium)
        impactMed.impactOccurred()
#else
        WKInterfaceDevice.current().play(.click)
#endif
    }
    
}


/// Plays a light vibration on the taptic engine.
func lightVibration () {
    
    DispatchQueue.global(qos: .userInteractive).async {
#if !os(watchOS)
        let impactMed = UIImpactFeedbackGenerator(style: .light)
        impactMed.impactOccurred()
#else
        WKInterfaceDevice.current().play(.click)
#endif
    }
    
}


/// Plays a double vibration on the taptic engine.
func doubleVibration () -> () {
    
    DispatchQueue.global(qos: .userInteractive).async {
#if !os(watchOS)
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
#else
        WKInterfaceDevice.current().play(.success)
#endif
    }
    
}


/// Plays an error vibration on the taptic engine.
func errorVibration() -> () {
    
    DispatchQueue.global(qos: .userInteractive).async {
#if !os(watchOS)
        UINotificationFeedbackGenerator().notificationOccurred(.error)
#else
        WKInterfaceDevice.current().play(.failure)
#endif
    }
}
