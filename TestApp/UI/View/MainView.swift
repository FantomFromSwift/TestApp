import SwiftUI

struct MainView: View {
    @State private var selectedImageName: String = "doggy" // начальное изображение
    @State private var selectedPet: PetType = .dog

    var body: some View {
        ZStack {
            Background()
            VStack(spacing: 50) {
                LargeText(text: UITitleStrings.translator.rawValue)
                SwapWordsView()

                HStack {
                    MicrophoneCell(onTap: {})
                    Spacer()
                    PetsCellView(
                        selectedPet: selectedPet,
                        onDogTap: {
                            selectedPet = .dog
                            selectedImageName = "doggy"
                        },
                        onCatTap: {
                            selectedPet = .cat
                            selectedImageName = "citty"
                        }
                    )
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 45)

                ImageWithFixedSize(imageName: selectedImageName, width: 184, height: 184)

                Spacer()
            }
        }
    }
}

#Preview {
    MainView()
}
