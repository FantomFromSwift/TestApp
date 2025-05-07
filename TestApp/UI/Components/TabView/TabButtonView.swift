
import SwiftUI

struct TabButtonView: View {
    
    let image: String
    let text: UITabStrings
    let tabNumber: Int
    
    @Binding var selectedTab: Int
    
    var body: some View {
        GeometryReader { button in
            Button {
                selectedTab = tabNumber
            } label: {
                VStack(spacing: 4) {
                    Image(image)
                        .renderingMode(.template) // Важно для изменения цвета
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(selectedTab == tabNumber ? .black : .gray)
                    
                    SmallText(text: text.rawValue)
                        .foregroundColor(selectedTab == tabNumber ? .black : .gray)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .frame(height: 82)
    }
}
