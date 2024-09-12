import SwiftUI
import AVFAudio

@Observable
class AudioWithSliderNoTimerViewModel {
  var player: AVAudioPlayer?
  var duration: TimeInterval = 0.0
  var currentTime: TimeInterval {
    get {
      return player?.currentTime ?? 0.0
    }
    set {} // Sliderの引数のところでエラーになるからとりあえず
  }

  init() {
    let content = Bundle.main.url(forResource: "Morning", withExtension: "mp3")!
    do {
      player = try AVAudioPlayer(contentsOf: content)
      player?.prepareToPlay()
      self.player = player
    } catch {
      print(error)
    }
  }
}
