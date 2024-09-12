import SwiftUI
import AVFAudio

struct AudioWithSliderView: View {
  @State var sliderValue: TimeInterval = 0.0
  @State var sliderMax: TimeInterval = 0.0
  @State var player: AVAudioPlayer?
  @State var timer: Timer?

  var body: some View {
    VStack {
      Button(action: {
        player?.play()
      }, label: {
        Text("play")
      })
      Slider(value: $sliderValue, in: 0...sliderMax)
    }.onAppear {
      do {
        let content = Bundle.main.url(forResource: "Morning", withExtension: "mp3")!
        player = try AVAudioPlayer(contentsOf: content)
        player?.prepareToPlay()
        sliderMax = player?.duration ?? 0

        timer = Timer
            .scheduledTimer(
              withTimeInterval: 0.05, // ここの値が小さくなるほど滑らか
              repeats: true
            ) { _ in
              sliderValue = player?.currentTime ?? 0
            }
      } catch {
        print(error)
      }
    }
    .onDisappear {
      player?.stop()
      timer?.invalidate()
    }
  }
}

#Preview {
  AudioWithSliderView()
}
