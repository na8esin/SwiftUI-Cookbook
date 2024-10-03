import SwiftUI

struct MenuView: View {
  @State private var park: [Park] = []
  @State private var path = NavigationPath()
  
  var body: some View {
    NavigationStack(path: $park) {
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
    // ここから別ナビゲーション
    // ios18でも引数が渡せるパターン
    // 17.5でもOK
    NavigationStack(path: $path) {
      NavigationLink(destination: NewStackParentView(path: $path)) {
        Text("NewStackParentView")
          .font(.title2)
      }
      .navigationDestination(for: String.self) { selection in
        NewStackChildView(value: selection)
      }
    }
  }
}

#Preview {
  MenuView()
}
