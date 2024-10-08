import SwiftUI

struct AudioWithSliderNoTimerView: View {
  @State var vm = AudioWithSliderNoTimerViewModel()

  var body: some View {
    VStack {
      Button(action: {
        vm.play()
      }, label: {
        Text("play")
      })
      Slider(value: $vm.currentTime, in: 0...vm.duration)
    }
    .onDisappear {
      vm.stop()
    }
  }
}

#Preview {
  AudioWithSliderNoTimerView()
}
