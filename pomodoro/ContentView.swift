//
//  ContentView.swift
//  pomodoro
//
//  Created by Kalan on 2021/10/14.
//

import SwiftUI

struct ContentView: View {
  @StateObject var store = AppStore
  
  private var formatted: String {
    return store.remainingTime.timeFormatted()
  }
  
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      VStack {
        Text("Remaining Time")
          .font(.headline)
        Text(formatted)
          .font(.custom("MonoLisa", size: 50))
      }.frame(width: 250)
      
      StatusIndicator(state: store.connected)
      
      HStack(alignment: .center, spacing: 5) {
        CommandButton(onAction: {
          BluetoothManager.shared.write(command: .start)
        }, text: "Start").disabled(!store.connected)
        
        
        CommandButton(onAction: {
          if (store.isRunning) {
            BluetoothManager.shared.write(command: .pause)
            store.isRunning = false
          } else {
            BluetoothManager.shared.write(command: .resume)
            store.isRunning = true
            
          }
        }, text: store.isRunning ? "Pause" : "Resume").disabled(!store.connected)
        
        
        if (!store.connected) {
          CommandButton(onAction: {
            BluetoothManager.shared.scan()
          }, text: "Reconnect")
        }
      }
      
      
    }
    .padding(10)
    .frame(width: 500.0, height: 300.0, alignment: .top)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
