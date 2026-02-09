import SwiftUI

struct BottomSheet: View {
    let title: String
    let type: NewsType
    let date: String
    let largeImage: ImageResource
    let description: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 5) {
                    Image(.back)
                        .foregroundStyle(.blue)
                    Text("Назад")
                        .font(.system(size: 17))
                        .foregroundStyle(.blue)
                }
                .onTapGesture {
                    dismiss()
                }
                .padding(.vertical, 32)
                
                Text(title)
                    .font(.system(size: 32, weight: .semibold))
                    .lineSpacing(2)
                    .padding(.bottom, 8)
                HStack(spacing: 8) {
                    ZStack{
                        HStack(spacing: 3) {
                            Image(type == NewsType.news ? .mic : .discountSmall)
                            Text(type == NewsType.news ? "Новости" : "Акция")
                                .font(.system(size: 12, weight: .semibold))
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 5)
                    .background(.buttonYellow)
                    .cornerRadius(4)
                    ZStack{
                        Text(date)
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 6)
                    .background(.buttonYellow)
                    .cornerRadius(4)
                }
                Image(largeImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 196)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.vertical, 16)
                Text(description)
                    .font(.system(size: 15))
                    .lineSpacing(5)
                Spacer()
            }
        }
        .padding(.horizontal, 24)
        .scrollIndicators(.hidden)
    }
}
