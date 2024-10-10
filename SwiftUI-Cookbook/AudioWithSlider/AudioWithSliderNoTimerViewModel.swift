import SwiftUI
import AVKit

// https://developer.apple.com/documentation/avfoundation/media_playback/monitoring_playback_progress_in_your_app

@Observable
class AudioWithSliderNoTimerViewModel {
  private let player = AVPlayer()
  private var timeObserver: Any?

  private(set) var duration: TimeInterval = 0.0
  var currentTime: TimeInterval = 0.1

  init() {
    let content = Bundle.main.url(forResource: "Morning", withExtension: "mp3")!
    let item = AVPlayerItem(url: content)
    player.replaceCurrentItem(with: item)
  }

  func play() {
    addPeriodicTimeObserver()
    player.play()
  }

  func stop() {
    player.pause()
    removePeriodicTimeObserver()
  }

  /// Adds an observer of the player timing.
  private func addPeriodicTimeObserver() {
      // Create a 0.5 second interval time.
      let interval = CMTime(value: 1, timescale: 2)
      timeObserver = player.addPeriodicTimeObserver(forInterval: interval,
                                                    queue: .main) { [weak self] time in
          guard let self else { return }
          // Update the published currentTime and duration values.
          currentTime = time.seconds
          duration = player.currentItem?.duration.seconds ?? 0.0
      }
  }


  /// Removes the time observer from the player.
  private func removePeriodicTimeObserver() {
      guard let timeObserver else { return }
      player.removeTimeObserver(timeObserver)
      self.timeObserver = nil
  }
}
