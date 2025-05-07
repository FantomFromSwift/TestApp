import SwiftUI

struct Background: View {
    var body: some View {
        ZStack{
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white,
                    Color.green.opacity(0.3)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
        }
    }
}

#Preview {
    Background()
}
