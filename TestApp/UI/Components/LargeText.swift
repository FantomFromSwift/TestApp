
import SwiftUI

struct LargeText: View {
    let text: String

    var body: some View {
        Text(text)
            .font(.system(size: 32, weight: .bold))
            .foregroundColor(.black)
    }
}
