import SwiftUI

struct MenuView: View {
  @State private var park: [Park] = []

  var body: some View {
    NavigationStack(path: $park) {
      NavigationLink(destination: NewStackParentView(park: $park)) {
        Text("NewStackParentView")
          .font(.title2)
      }
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
