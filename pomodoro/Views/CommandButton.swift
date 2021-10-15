//
//  Button.swift
//  pomodoro
//
//  Created by Kalan on 2021/10/15.
//

import SwiftUI

struct Button: View {
  var onAction: () -> Void
  var text: String
  
    var body: some View {
      Button(action: {
        self.onAction()
      }) {
        Text(text)
          .font(.body)
          .foregroundColor(.white)
          .padding(.horizontal, 15)
          .padding(.vertical, 5)
          .background(Color(red: 0.0, green: 0.4823529411764706, blue: 1.0))
          .cornerRadius(5)
      }.buttonStyle(PlainButtonStyle())
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
      Button(onAction: {}, text: "test")
    }
}
