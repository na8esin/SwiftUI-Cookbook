import SwiftUI

struct AudioWithSliderNoTimerView: View {
  @State var vm = AudioWithSliderNoTimerViewModel()
  
  @State var sliderValue: Double = 0 // テスト用

  var body: some View {
    VStack {
      Button(action: {
        vm.play()
      }, label: {
        Text("play")
      })
      Button(action: {
        vm.stop()
      }, label: {
        Text("stop")
      })
      NewTappableSliderView(value: $sliderValue, in: 0...100, step: 0.1)
    }
    .onDisappear {
      vm.stop()
    }
  }
}

#Preview {
  AudioWithSliderNoTimerView()
}
