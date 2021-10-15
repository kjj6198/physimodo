
//
//  StatusIndicator.swift
//  pomodoro
//
//  Created by Kalan on 2021/10/15.
//

import SwiftUI


struct StatusIndicator: View {
  var state: Bool
  var body: some View {
    HStack(alignment: .center) {
      Circle()
        .size(width: 10, height: 10)
        .padding(5)
        .frame(width: 20, height: 20)
        .foregroundColor(state ? .green : .red)
      Text(state ? "connected" : "disconnected").font(.caption)
      
    }.frame(width: 150, height: 50)
  }
}

struct StatusIndicator_Previews: PreviewProvider {
  static var previews: some View {
    StatusIndicator(state: true)
  }
}
