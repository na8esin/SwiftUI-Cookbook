import SwiftUI

struct MenuView: View {
  var body: some View {
    NavigationStack {
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
