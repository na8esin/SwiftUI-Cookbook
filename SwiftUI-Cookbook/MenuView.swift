import SwiftUI

struct MenuView: View {
  var body: some View {
    
    NavigationStack {
      NavigationLink(destination: StackParentView()) {
        Text("StackParentView")
          .font(.title2)
      }
      NavigationLink(destination: AudioWithSliderNoTimerView()) {
        Text("AudioWithSliderNoTimerView")
          .font(.title2)
      }
      NavigationLink(destination: ContentView()) {
        Text("ContentView")
          .font(.title2)
      }
      NavigationLink(destination: AudioWithSliderView()) {
        Text("AudioWithSliderView")
          .font(.title2)
      }
    }
  }
}

#Preview {
  MenuView()
}
