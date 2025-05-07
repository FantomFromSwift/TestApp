import SwiftUI

struct PetsCellView: View {
    var selectedPet: PetType
    var onDogTap: () -> Void
    var onCatTap: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            // DOGGY
            Button(action: onDogTap) {
                Image("doggy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding()
                    .frame(width: 70, height: 70)
                    .background(Color(red: 236/255, green: 251/255, blue: 199/255))
                    .cornerRadius(10)
                    .opacity(selectedPet == .dog ? 1.0 : 0.5)
            }
            
            // CITTY
            Button(action: onCatTap) {
                Image("citty")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding()
                    .frame(width: 70, height: 70)
                    .background(Color(red: 209/255, green: 231/255, blue: 252/255))
                    .cornerRadius(10)
                    .opacity(selectedPet == .cat ? 1.0 : 0.5)
            }
        }
        .frame(width: 107, height: 176)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
    }
}

//#Preview {
//    PetsCellView(
//            onDogTap: { print("Dog tapped") },
//            onCatTap: { print("Cat tapped") }
//        )
//        .padding()
//        .background(Color.gray.opacity(0.1))
//}
