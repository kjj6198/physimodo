//
//  String.swift
//  pomodoro
//
//  Created by Kalan on 2021/10/15.
//

import Foundation

public extension String {
  func timeFormatted() -> String {
    self.padding(toLength: 2, withPad: "0", startingAt: 0)
  }
}
