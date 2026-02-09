import SwiftUI

struct AppView: View {
    @State private var showDialog = false
    @State private var activeTab = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $activeTab) {
                HomeView(isActive: $showDialog, activeTab: $activeTab)
                    .tabItem {
                        Image("Home")
                        Text("Главная")
                    }
                    .tag(0)
                
                NewsView()
                    .tabItem {
                        Image("Info")
                        Text("Информация")
                    }
                    .tag(1)
                
                Text("Shops Screen")
                    .tabItem {
                        Image("ShoppingCart")
                        Text("Магазины")
                    }
                    .tag(2)
                
                ProfileView()
                    .tabItem {
                        Image("User")
                        Text("Профиль")
                    }
                    .tag(3)
            }
            .onAppear() {
                UITabBar.appearance().backgroundColor = .bgDarkGrey
                UITabBar.appearance().unselectedItemTintColor = .white.withAlphaComponent(0.5)
            }
            .tint(.buttonYellow)
            .blur(radius: showDialog ? 25 : 0)
            
            if showDialog {
                Color.black.opacity(0.7)
                    .ignoresSafeArea()
            }
            
            if showDialog {
                DetailsDialog(isActive: $showDialog)
                    .zIndex(1)
            }
        }
    }
}
