
import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Int = 1
    
    var body: some View {
        ZStack(alignment: .bottom){
            
            VStack {
                Spacer()
                ZStack{
                    if selectedTab == 1 {
                        MainView()
                    } else if selectedTab == 2{
                        SettingsView()
                    }
                }
            }
            CustomTabView(selectedTab: $selectedTab)
        }
    }
}

#Preview {
    ContentView()
}
