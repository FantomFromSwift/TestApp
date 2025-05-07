
import SwiftUI

struct SmallTabView: View {
    
    var translatorAction: () -> Void
    var clickerAction: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 52) {
            
            Button(action: translatorAction) {
                VStack(spacing: 4) {
                    Image("messages-2")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    SmallText(text: UITabStrings.translator.rawValue)
                }
            }

            Button(action: clickerAction) {
                VStack(spacing: 4) {
                    Image("Group-3")
                        .resizable()
                        .frame(width: 24, height: 24)
                    SmallText(text: UITabStrings.clicker.rawValue)
                }
            }
        }
        .frame(width: 216, height: 82)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    SmallTabView(
        translatorAction: { print("Translator tapped") },
        clickerAction: { print("Clicker tapped") }
    )
    .padding()
    .background(Color.gray.opacity(0.1))
}
