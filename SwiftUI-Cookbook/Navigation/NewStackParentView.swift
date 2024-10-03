import SwiftUI

/// https://developer.apple.com/documentation/swiftui/navigationstack
/// https://developer.apple.com/documentation/swiftui/migrating-to-new-navigation-types
struct NewStackParentView: View {
  @Binding var path: NavigationPath
  
  var body: some View {
    VStack {
        Button(action: {
          path.append("hello")
        }, label: {
          Text("Push!")
        })
      }
  }
}

#Preview {
  @Previewable @State var path = NavigationPath()
  NewStackParentView(path: $path)
}
