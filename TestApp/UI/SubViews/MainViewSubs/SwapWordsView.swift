import SwiftUI

struct SwapWordsView: View {
    @State private var isSwapped = false
    
    var body: some View {
        HStack(spacing: 20) {
            
            Button(action: {
                isSwapped.toggle()
            }) {
                MediumText(text: isSwapped ? UITranslatorStrings.pat.rawValue : UITranslatorStrings.human.rawValue)
                    .frame(width: 135, height: 61)
            }

            
            Button(action: {
                isSwapped.toggle()
            }) {
                Image("arrow-swap-horizontal")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(5)
            }
            
            Button(action: {
                isSwapped.toggle()
            }) {
                MediumText(text: isSwapped ? UITranslatorStrings.human.rawValue : UITranslatorStrings.pat.rawValue)
                    .frame(width: 135, height: 61)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.clear) 
        .padding(.horizontal, 40)
    }
}

#Preview {
    SwapWordsView()
}
