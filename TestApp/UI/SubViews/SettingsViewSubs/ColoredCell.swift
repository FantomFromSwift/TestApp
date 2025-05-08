
import SwiftUI

struct ColoredCell: View {
    let text: String

    var body: some View {
        HStack {
            MediumText(text: text)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.black)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(red: 214/255, green: 220/255, blue: 255/255))
        .cornerRadius(20)
    }
}
