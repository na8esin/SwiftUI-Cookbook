import SwiftUI

struct TappableSliderView: View {
  @State var sliderValue: Float = 1
  
  var body: some View {
    TappableSlider(value: $sliderValue, range: 1...7, step: 1.0)
  }
}

// 逆にスライドできないじゃん
struct TappableSlider: View {
  var value: Binding<Float>
  var range: ClosedRange<Float>
  var step: Float
  
  var body: some View {
    GeometryReader { geometry in
      Slider(value: self.value, in: self.range, step: self.step)
        .gesture(DragGesture(minimumDistance: 0)
        .onEnded { value in
          let percent = min(max(0, Float(value.location.x / geometry.size.width * 1)), 1)
          let newValue = self.range.lowerBound + round(percent * (self.range.upperBound - self.range.lowerBound))
          self.value.wrappedValue = newValue
        })
    }
  }
}

#Preview {
  TappableSliderView()
}
