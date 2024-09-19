import SwiftUI

struct StackChildView: View {
  @State var value: String
  init(value: String) {
    self.value = value
  }
  
  var body: some View {
    VStack {
      Text(UIDevice.current.systemVersion)
      Text(value)
    }
  }
}

#Preview {
  StackChildView(value: "hello")
}
