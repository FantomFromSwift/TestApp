
import SwiftUI

struct ImageWithFixedSize: View {
    let imageName: String
    let width: CGFloat
    let height: CGFloat
    let contentMode: ContentMode

    init(
        imageName: String,
        width: CGFloat,
        height: CGFloat,
        contentMode: ContentMode = .fit
    ) {
        self.imageName = imageName
        self.width = width
        self.height = height
        self.contentMode = contentMode
    }

    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: contentMode)
            .frame(width: width, height: height)
    }
}
