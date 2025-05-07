import SwiftUI

struct BottomPetsCellView: View {
    var onFirstTap: () -> Void = {}
    var onSecondTap: () -> Void = {}

    var body: some View {
        HStack(spacing: 100) {
            // Первая кнопка (image 1)
            Button(action: onFirstTap) {
                ZStack {
                    Circle()
                        .fill(Color(red: 209/255, green: 231/255, blue: 252/255))
                        .frame(width: 70, height: 70)

                    Image("image 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
            }

            // Вторая кнопка (image 5)
            Button(action: onSecondTap) {
                ZStack {
                    Circle()
                        .fill(Color(red: 236/255, green: 251/255, blue: 199/255))
                        .frame(width: 70, height: 70)

                    Image("image 5")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                }
            }
        }
        .frame(width: 350, height: 94)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    BottomPetsCellView(
        onFirstTap: { print("Image 1 tapped") },
        onSecondTap: { print("Image 5 tapped") }
    )
}
