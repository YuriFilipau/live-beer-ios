import SwiftUI

struct LargeButton: View {
    var label: String
    var onTap: (() -> Void)?
    
    var body: some View {
        ZStack {
            Text(label)
                .font(.system(size: 16, weight: .semibold))
        }
        .frame(height: 56)
        .frame(maxWidth: .infinity)
        .background(.buttonYellow)
        .cornerRadius(10)
        .contentShape(Rectangle())
        .onTapGesture {
            onTap?()
        }
    }
}

#Preview {
    NewsView()
}
