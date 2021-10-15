//
//  String.swift
//  pomodoro
//
//  Created by Kalan on 2021/10/15.
//

import Foundation

public extension Int {
  func timeFormatted() -> String {
    let minutes = self / 60
    let seconds = self % 60
    
    return String(format: "%02d:%02d", minutes, seconds)
  }
}
