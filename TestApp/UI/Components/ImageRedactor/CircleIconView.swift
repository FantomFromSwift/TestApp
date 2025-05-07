
import SwiftUI

struct CircleIconView: View {
    let imageName: String

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 48, height: 48)

            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
    }
}

#Preview {
    CircleIconView(imageName: "Group-3")
}
