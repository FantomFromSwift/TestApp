
import SwiftUI

struct RepeatBox: View {
    var body: some View {
        HStack(spacing: 10){
            ImageWithFixedSize(imageName: "Rotate - Right", width: 16, height: 16)
            SmallText(text: UIResultStrings.oneMoreTime.rawValue)
        }
        .padding()
        .frame(width: 291, height: 54)
        .background(Color(red: 214/255, green: 220/255, blue: 255/255))
        .cornerRadius(16)
        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
        .multilineTextAlignment(.leading)
    }
}

#Preview {
    RepeatBox()
}
