
import SwiftUI

struct SmallText: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.gray)
    }
}
