import SwiftUI

struct LargeNewsCard: View {
    let title: String
    let date: String
    let image: ImageResource
    var onTap: (() -> Void)
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .clipped()
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(4)
                    .foregroundColor(.black)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
                
                Text(date)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .frame(height: 96)
        .background(.buttonYellow)
        .cornerRadius(10)
        .onTapGesture {
            onTap()
        }
    }
}

