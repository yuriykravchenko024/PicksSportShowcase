import SwiftUI

struct TabBarView: View {
    @State private var tab: Tab = .home
    
    var body: some View {
        ZStack {
            content
                .mask {
                    LinearGradient(stops: [.init(color: .black, location: 0), .init(color: .black, location: 0.9), .init(color: .clear, location: 1)], startPoint: .top, endPoint: .bottom)
                }
            TabBar(selection: $tab)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
        }
        .background {
            Image(.bg)
                .scaleAspectFill()
                .ignoresSafeArea()
        }
        .ignoresSafeArea(.keyboard)
    }
    
    @ViewBuilder
    private var content: some View {
        switch tab {
        case .home:
            HomeView()
        case .moments:
            MomentsView()
        case .search:
            SearchView()
        case .game:
            GameView()
        case .favorites:
            FavoritesView()
        }
    }
}

struct TabBar: View {
    @Binding var selection: Tab
    @Namespace var namespace
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases) { tab in
                ZStack {
                    if selection == tab {
                        ZStack {
                            Circle()
                                .fill(LinearGradient(colors: [Color("6D00AF"), Color("7E1DDF")], startPoint: .leading, endPoint: .trailing))
                            
                            Circle()
                                .strokeBorder(LinearGradient(colors: [Color("9C37FF"), Color("9C37FF")], startPoint: .top, endPoint: .bottom), lineWidth: 1)
                        }
                        .matchedGeometryEffect(id: "circle", in: namespace)
                    }
                    
                    VStack(spacing: 5) {
                        Image(tab.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        if selection == tab {
                            Text(tab.title)
                                .font(.ADLaMDisplay(size: 10))
                                .foregroundStyle(.white)
                                .textCase(.uppercase)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .padding(6)
                }
                .aspectRatio(1, contentMode: .fit)
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {
                    selection = tab
                }
            }
        }
        .padding(5)
        .background {
            ZStack {
                Capsule()
                    .fill(Color("221190"))
                Capsule()
                    .strokeBorder(Color("442AEC"), lineWidth: 1)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: selection)
    }
}

#Preview {
    TabBarView()
}
