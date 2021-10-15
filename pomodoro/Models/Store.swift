//
//  Store.swift
//  pomodoro
//
//  Created by Kalan on 2021/10/15.
//

import Foundation

final class Store: ObservableObject {
  @Published var isRunning: Bool = false
  @Published var connected: Bool = false
  @Published var remainingTime: Int = 1800
}

var AppStore = Store()


