import SwiftUI

// https://stackoverflow.com/questions/58687298/setting-the-value-of-a-swiftui-slider-by-tapping-on-it
// の2つ目のAnswer
// タップもできるし、ドラッグアンドドロップもできる

struct NewTappableSliderView: View {
  var value: Binding<Double>
  var range: ClosedRange<Double>
  var step: Double
  
  init(value: Binding<Double>, in range: ClosedRange<Double>, step: Double) {
    self.value = value
    self.range = range
    self.step = step
  }
  
  var body: some View {
    GeometryReader { geometry in
      Slider(value: value, in: range, step: step)
        .gesture(DragGesture(minimumDistance: 0).onChanged { gestureValue in
          // Ensure the drag location is within the view's bounds and the step is not zero
          guard gestureValue.location.x >= 0 && gestureValue.location.x <= geometry.size.width, step != 0 else { return }
          
          // Calculate the percentage of the slider's width where the drag happened
          let clampedPercent = max(0, min(gestureValue.location.x / geometry.size.width, 1))
          
          // Scale this percentage to the slider's value range
          let scaledRangeValue = range.lowerBound + (clampedPercent * (range.upperBound - range.lowerBound))
          
          // Round this value to the nearest step
          let roundedToStep = round(scaledRangeValue / step) * step
          
          // Ensure the final value adheres to the slider's bounds
          let clampedValue = max(range.lowerBound, min(roundedToStep, range.upperBound))
          
          // Update the bound value
          self.value.wrappedValue = clampedValue
        })
        .frame(
          width: geometry.frame(in: .global).width,
          height: geometry.frame(in: .global).height
        )
    }
  }
}

#Preview {
  @Previewable @State var value: Double = 0
  NewTappableSliderView(value: $value, in: 0...100, step: 0.1)
}
