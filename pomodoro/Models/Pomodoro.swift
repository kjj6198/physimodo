//
//  Pomodoro.swift
//  pomodoro
//
//  Created by Kalan on 2021/10/15.
//

import Foundation

struct Pomodoro: Hashable, Codable {
  var state: PomodoroState
  var isRunning: Bool
  var remainingTime: Int
  
  enum PomodoroState: Codable {
    case idle, working, resting
  }
  
  init(data: [UInt8]) {
    guard data.count >= 4 else {
      fatalError("Can not parse data")
    }
    
    let h = Int(data[1])
    let l = Int(data[2])

    self.remainingTime = h * 256 + l
    self.isRunning = data[3] == 0x01
    self.state = data[3] == 1 ? .working : .resting
  }
}
