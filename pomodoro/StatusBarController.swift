//
//  StatusBarController.swift
//  pomodoro
//
//  Created by Kalan on 2021/10/14.
//

import AppKit
import SwiftUI

class StatusBarController {
  private var statusBar: NSStatusBar
  private var statusItem: NSStatusItem
  private var popover: NSPopover
  
  init(_ popover: NSPopover) {
    self.popover = popover
    statusBar = NSStatusBar.init()
    statusItem = statusBar.statusItem(withLength: 20.0)
    
    if let statusBarButton = statusItem.button {
      statusBarButton.image = NSImage(systemSymbolName: "alarm.fill", accessibilityDescription: "Pomodoro")
      
      statusBarButton.image?.size = NSSize(width: 20.0, height: 20.0)
      statusBarButton.image?.isTemplate = true
      statusBarButton.action = #selector(togglePopover(sender:))
      statusBarButton.target = self
    }
  }
  
  @objc func togglePopover(sender: AnyObject) {
    if (popover.isShown) {
      popover.performClose(sender)
    } else {
      if let button = statusItem.button {
        
        popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.maxY)
      }
    }
  }
}
