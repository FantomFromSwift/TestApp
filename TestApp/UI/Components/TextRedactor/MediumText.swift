
import SwiftUI

struct MediumText: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.black)
    }
}
