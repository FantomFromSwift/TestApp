
import SwiftUI

struct CustomTabView: View {
    @Binding var selectedTab: Int
    var body: some View {
        HStack{
            TabButtonView(image: "messages-2", text: .translator, tabNumber: 1, selectedTab: $selectedTab)
            TabButtonView(image: "Group-3", text: .clicker, tabNumber: 2, selectedTab: $selectedTab)
        }
        
        .background(.white)
        .cornerRadius(16)
        .padding(.horizontal)
        .frame(width: 220, height: 82)
        .padding(.bottom, 20)
        
    }
}

#Preview {
    ContentView()
}


