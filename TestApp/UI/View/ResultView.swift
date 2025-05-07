import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ZStack {
                Background()
                VStack{
                    TextBox(generatedText: "hello")
                    
                    ImageWithFixedSize(imageName: "doggy", width: 184, height: 184)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                        print("Left button tapped")
                    }) {
                        CircleIconView(imageName: "Close")
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    LargeText(text: UITitleStrings.result.rawValue)
                }
            }
        }
        
    }
}

#Preview {
    ResultView()
}
