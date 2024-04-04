//
//  Promixity_TrackerApp.swift
//  Promixity Tracker
//
//  Created by user238598 on 4/2/24.
//

import SwiftUI

@main
struct Promixity_TrackerApp: App {
    
    private let persistenceController = PersistenceController.sharedInstance
    
    // @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var scenePhase
    @StateObject var settings = Settings.sharedInstance
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                // .environmentObject(appDelegate)
                .onChange(of: scenePhase) { oldPhase, newPhase in
                    
                    if newPhase == .active {
                        settings.isBackground = false
                        
                    } else if newPhase == .inactive  || newPhase == .background {
                        settings.isBackground = true
                        
                    }
                }
                .onAppear(perform: {
                    settings.isBackground = scenePhase != .active
                })
        }
    }
}
