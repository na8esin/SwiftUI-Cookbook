import SwiftUI

struct NewStackChildView: View {
  @State var value: String
  
    var body: some View {
      Text("\(value)")
    }
}

#Preview {
  NewStackChildView(value: "")
}
