import SwiftUI

struct NewsCard: View {
    let title: String
    let date: String
    let type: NewsType
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                        .lineSpacing(4.6)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    Text(date)
                        .font(.system(size: 12, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .frame(width: geometry.size.width, height: geometry.size.height)
                
            
                Image(type == NewsType.discount ? .discount : .news)
                    .position(
                        x: geometry.size.width - 20,
                        y: geometry.size.height - 20
                    )
            }
        }
        .frame(width: 132, height: 138)
        .background(.buttonYellow)
        .cornerRadius(10)
        .clipped()
    }
}
