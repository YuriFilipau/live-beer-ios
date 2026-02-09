import SwiftUI

struct NewsView: View {
    let newsType = ["Акции", "Новости"]
    @State private var viewModel = NewsViewModel()
    @State private var isSheetPresented = false
    @State private var currentSegment = 0
    
    private var filteredNews: [News] {
        viewModel.filteredNews(for: currentSegment)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ZStack(alignment: .topLeading) {
                    Image(.largeBerry)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width)
                        .frame(height: 250)
                        .clipped()
                        .edgesIgnoringSafeArea(.top)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Информация")
                            .font(.system(size: AppLayouts.s36, weight: .semibold))
                            .foregroundColor(.black)
                            .padding(.top, AppLayouts.s24)
                            .padding(.horizontal, AppLayouts.s24)
                        
                        Picker("Title", selection: $currentSegment) {
                            ForEach(newsType.indices, id: \.self) { index in
                                Text(newsType[index])
                                    .tag(index)
                            }
                        }
                        .padding(.top, AppLayouts.s24)
                        .padding(.bottom, AppLayouts.s20)
                        .padding(.horizontal, AppLayouts.s24)
                        .pickerStyle(.segmented)
                        
                        ScrollView {
                            VStack(spacing: AppLayouts.s8) {
                                ForEach(filteredNews, id: \.self) { news in
                                    LargeNewsCard(title: news.title, date: news.date, image: news.image) {
                                        isSheetPresented = true
                                    }
                                    .sheet(isPresented: $isSheetPresented) {
                                        BottomSheet(
                                            title: news.title,
                                            type: news.type,
                                            date: news.date,
                                            largeImage: news.largeImage,
                                            description: news.description
                                        )
                                    }
                                    .padding(.horizontal, AppLayouts.s24)
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}
