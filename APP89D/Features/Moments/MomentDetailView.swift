import SwiftUI

struct MomentDetailView: View {
    let moment: Moment
        
    @AppStorage(SaveKey.favoriteMoments) var favoriteMoments: [Moment] = []
    
    private var isFavorited: Bool {
        return favoriteMoments.contains { $0.id == moment.id }
    }
    
    var body: some View {
        VStack(spacing: 16) {
            BackButton()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 10)
            
            ScrollView {
                VStack(spacing: 20) {
                    Image(moment.imageName)
                        .scaleAspectFill()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color("9C36FF"), lineWidth: 1)
                        }
                        .padding(.horizontal, 20)
                    
                    Text(moment.title)
                        .font(.ADLaMDisplay(size: 22))
                   
                    Text(moment.text)
                        .font(.arial(size: 14))
                        .lineSpacing(3)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    
                    if !isFavorited {
                        Button("Add to Favorites") {
                            favoriteMoments.append(moment)
                        }
                        .buttonStyle(.main)
                        .padding(.horizontal, 20)
                    }
                }
                .foregroundStyle(.white)
                .padding(.bottom, 40)
            }
        }
        .background {
            Image(.bg)
                .scaleAspectFill()
                .ignoresSafeArea()
        }
        .hideSystemNavBar()
        .animation(.default, value: isFavorited)
    }
}

#Preview {
    MomentDetailView(moment: .allMoments[0])
}
