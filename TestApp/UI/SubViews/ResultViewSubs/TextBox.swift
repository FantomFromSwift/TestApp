import SwiftUI

struct TextBox: View {
    let generatedText: String

    var body: some View {
        VStack(spacing: -10){
            SmallText(text: generatedText)
                .padding()
                .frame(width: 291, height: 142)
                .background(Color(red: 214/255, green: 220/255, blue: 255/255))
                .cornerRadius(16)
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                .multilineTextAlignment(.leading) 
            
            Image("Polygon 2")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 75)
        }
    }
}

struct TextBox_Previews: PreviewProvider {
    static var previews: some View {
        TextBox(generatedText: "Згенерований довгий текст для прикладу, який може займати кілька рядків.")
            .previewLayout(.sizeThatFits)
    }
}
