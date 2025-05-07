import SwiftUI

struct MicrophoneCell: View {
    var onTap: () -> Void

    var body: some View {
        VStack(spacing: 12) {
            Button(action: onTap) {
                Image("microphone-2")
                    .resizable()
                    .frame(width: 70, height: 70)
            }
            MediumText(text: UITranslatorStrings.startSpeak.rawValue)
        }
        .frame(width: 178, height: 176)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    MicrophoneCell {
        print("Microphone tapped")
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}
