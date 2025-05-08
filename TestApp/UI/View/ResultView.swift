import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: ResultViewModel
    @State private var showTextBox = true
    @State private var showRepeatBox = false
    @State private var currentSpacing: CGFloat = 20

    var body: some View {
        NavigationStack{
            ZStack {
                Background()
                VStack(spacing: currentSpacing) {
                    ZStack {
                        if showTextBox {
                            TextBox(generatedText: viewModel.generatedText)
                        }
                        if showRepeatBox {
                            RepeatBox()
                                .onTapGesture {
                                    withAnimation {
                                        showTextBox = true
                                        showRepeatBox = false
                                        currentSpacing = 20
                                    }
                                }
                        }
                    }
                    ImageWithFixedSize(imageName: viewModel.petImageName, width: 184, height: 184)
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            showTextBox = false
                            showRepeatBox = true
                            currentSpacing = 220
                        }
                    }
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
    ResultView(viewModel: ResultViewModel(petImageName: "doggy", selectedPet: .dog))
}
