import SwiftUI

/// ios18だと、StackChildViewのvalueの値が次の画面に伝わらない
struct StackParentView: View {
  @State var isNext: Bool = false
  @State var childValue: String = ""
  
  var body: some View {
    Button(action: {
      childValue = "Good bye."
      isNext = true
    },label: {
      Text("次の画面")
    })
    NavigationLink(
      destination: StackChildView(value: childValue),
      isActive: $isNext
    ) {
      EmptyView()
    }
    
  }
}

#Preview {
  StackParentView()
}
