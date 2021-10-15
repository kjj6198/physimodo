//
//  pomodoroApp.swift
//  pomodoro
//
//  Created by Kalan on 2021/10/14.
//
import Cocoa
import SwiftUI
import Combine

import UserNotifications

class AppDelegate: NSObject, NSApplicationDelegate {
  var bleManager: BluetoothManager?
  var statusBar: StatusBarController?
  var popover = NSPopover.init()
  var cancellable: AnyCancellable?
  
  func applicationDidFinishLaunching(_ notification: Notification) {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
      if let error = error {
        print("no permission")
      }
    }
    
    cancellable = AppStore.objectWillChange.sink(receiveValue: {
      if (AppStore.remainingTime == 0) {
        let notification = UNMutableNotificationContent()
        notification.title = "Time's up"
        notification.subtitle = "You've just completed a pomodoro!"
        notification.badge = 1
        notification.sound = UNNotificationSound.default
        let request = UNNotificationRequest(identifier: "bluetooth-connect-noti", content: notification, trigger: nil)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
      }
    })
    
    let contentView = ContentView()
    bleManager = BluetoothManager.shared
    
    popover.contentSize = NSSize(width: 250, height: 360)
    popover.contentViewController = NSHostingController(rootView: contentView)
    
    // Create the Status Bar Item with the above Popover
    statusBar = StatusBarController.init(popover)
  }
  

}

@main
struct pomodoroApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
        }
    }
}
