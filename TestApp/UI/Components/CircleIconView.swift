
import SwiftUI

struct CircleIconView: View {
    let imageName: String

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 48, height: 48)

            Image("Group-3") // или замените на Image(imageName), если используете ассет
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
        .shadow(color: .black.opacity(0.7), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    CircleIconView(imageName: "Group-3")
}
