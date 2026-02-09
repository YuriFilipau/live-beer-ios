import SwiftUI

extension HomeView{
    @Observable
    class HomeViewModel{
        private(set) var sampleData: [HomeNews] = [
            HomeNews(
                title: "Новые сорта крафта уже в наличии в магазинах",
                date: "20.01.2022",
                type: .news,
            ),
            HomeNews(
                title: "Новые сорта крафта уже в наличии в магазинах",
                date: "20.01.2022",
                type: .news,
            ),
            HomeNews(
                title: "Новые сорта крафта уже в наличии в магазинах",
                date: "20.01.2022",
                type: .news,
            ),
            HomeNews(
                title: "Нам 10 лет повышаем скидку до 10% на всё!",
                date: "20.01.2022",
                type: .discount,
            ),
            HomeNews(
                title: "Нам 10 лет повышаем скидку до 10% на всё!",
                date: "20.01.2022",
                type: .discount,
            ),
            HomeNews(
                title: "Нам 10 лет повышаем скидку до 10% на всё!",
                date: "20.01.2022",
                type: .discount,
            ),
        ]
    }
}
