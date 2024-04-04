//
//  BackgroundAppRefresh.swift
//  Promixity Tracker
//
//  Created by Leon Böttger on 26.05.22.
//

import Foundation
import SwiftUI
import BackgroundTasks

/// Custom `UIApplicationDelegate` class
class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    var notificationManager = NotificationManager.sharedInstance
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        
        log("Finished launching")
        
        #if DEBUG
        evaluateDebugLaunchArguments()
        #endif
        
        notificationManager.scheduleNotificationForSurvey()
        
        return true
    }
}
