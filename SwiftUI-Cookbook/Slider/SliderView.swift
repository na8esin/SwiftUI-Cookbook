import SwiftUI

struct SliderView: View {
  @State private var rValue: Double = 0
  @State private var rText: String = "0"
  @State private var sliderValue: Double = 0.0
  
  var body: some View {
    VStack {
      HStack {
        Text("Red:")
          .foregroundColor(.red)
        
        // タップで変化ができない(デフォルトはできない)
        Slider(value: Binding(
          get: {
            self.rValue
          },
          set: { newValue in
            self.rValue = newValue
            self.rText = String("\(Int(self.rValue))")
            
          }
        ), in: 0...255, step: 1, onEditingChanged: {_ in })
        TextField("", text: $rText, onEditingChanged: { _ in
          rValue = Double(rText) ?? 0
        })
      }
      .padding(.bottom, 8)
      
      // onEditingChangedは設定しなくても、つまみは動かせる
      Slider(value: $sliderValue, in: 0...10, step: 0.1)
    }
  }
}

#Preview {
  SliderView()
}
