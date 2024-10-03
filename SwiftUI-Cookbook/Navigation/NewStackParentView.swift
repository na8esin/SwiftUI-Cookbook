import SwiftUI

/// https://developer.apple.com/documentation/swiftui/navigationstack
/// https://developer.apple.com/documentation/swiftui/migrating-to-new-navigation-types
struct NewStackParentView: View {
  @State var childValue: String = ""
  @Binding var park: [Park]
  
  var body: some View {
    VStack {
        Button(action: {
          childValue = "hello"
          park.append(.sequoia)
        }, label: {
          Text("Push!")
        })
      }
  }
}

#Preview {
  @Previewable @State var park: [Park] = []
  NewStackParentView(park: $park)
}
