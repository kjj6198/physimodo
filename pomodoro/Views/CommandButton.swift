//
//  Button.swift
//  pomodoro
//
//  Created by Kalan on 2021/10/15.
//

import SwiftUI

struct CommandButton: View {
  var onAction: () -> Void
  var text: String
  
  var body: some View {
    Button(action: {
      self.onAction()
    }) {
      Text(text)
        .font(.headline)
        .foregroundColor(.white)
        .padding(.horizontal, 50)
        .padding(.vertical, 15)
        .background(Color(red: 0.0, green: 0.4823529411764706, blue: 1.0))
        .cornerRadius(5)
    }.padding(8)
      .buttonStyle(PlainButtonStyle())
    
  }
}

struct Button_Previews: PreviewProvider {
  static var previews: some View {
    CommandButton(onAction: {}, text: "test")
  }
}
