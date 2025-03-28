import SwiftUI

struct SearchView: View {
    @State private var text = ""
    @FocusState private var isSearchFocused: Bool
    
    private var players: [Player] {
        return text.isEmpty ? Player.allPlayers : Player.searchPlayers(query: text)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("SEARCH")
                .font(.ADLaMDisplay(size: 25))
                .foregroundStyle(.white)
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
                    
                HStack {
                    TextField("", text: $text)
                        .focused($isSearchFocused)
                        .autocorrectionDisabled()
                        .keyboardType(.alphabet)
                        .font(.arial(size: 16))
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .frame(height: 40)
                        .background {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color("101863"))
                                RoundedRectangle(cornerRadius: 25)
                                    .strokeBorder(LinearGradient(colors: [Color("9C37FF"), Color("8216CD")], startPoint: .top, endPoint: .bottom), lineWidth: 2)

                                if text.isEmpty {
                                    Text("What are you looking for?")
                                        .font(.arial(size: 16))
                                        .foregroundStyle(.white.opacity(0.7))
                                        .padding(.horizontal, 20)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                        .simultaneousGesture(TapGesture().onEnded({ _ in
                            isSearchFocused = true
                        }))
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    isSearchFocused = false
                                }
                            }
                        }
                    
                    Button {
                        isSearchFocused = true
                    } label: {
                        ZStack {
                            Circle()
                                .fill(LinearGradient(colors: [Color("6D00AF"), Color("7E1DDF")], startPoint: .leading, endPoint: .trailing))
                            
                            Circle()
                                .strokeBorder(LinearGradient(colors: [Color("9C37FF"), Color("9C37FF")], startPoint: .top, endPoint: .bottom), lineWidth: 1)
                            
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.white)
                                .padding(10)
                        }
                        .frame(width: 40, height: 40)
                    }
                }
                .padding(.horizontal, 20)
            
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(
                    columns: Array(repeating: .init(spacing: 16), count: 2),
                    spacing: 16
                ) {
                    ForEach(players) { player in
                        NavigationLink {
                            PlayerDetailView(player: player)
                        } label: {
                            PlayerCell(player: player)
                        }
                        .id(player.id)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
                .animation(.default, value: players)
            }
        }
        .simultaneousGesture(DragGesture(minimumDistance: 10).onChanged({ _ in
            if isSearchFocused { isSearchFocused = false }
        }))
    }
}

#Preview {
    SearchView()
}
