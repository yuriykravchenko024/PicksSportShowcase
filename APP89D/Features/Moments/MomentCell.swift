import SwiftUI

struct MomentCell: View {
    let moment: Moment
    
    @AppStorage(SaveKey.favoriteMoments) var favoriteMoments: [Moment] = []
    
    private var isFavorited: Bool {
        return favoriteMoments.contains { $0.id == moment.id }
    }
    
    var body: some View {
        HStack(spacing: 5) {
            Image(moment.imageName)
                .scaleAspectFill()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 150, height: 95)
                .overlay {
                    RoundedRectangle(cornerRadius: 10).strokeBorder(Color("9C36FF"), lineWidth: 1)
                }
            
            Text(moment.title)
                .font(.ADLaMDisplay(size: 14))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .foregroundStyle(.white)
        .padding(10)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(LinearGradient(colors: [Color("1234E9"), Color("9F1CFF")], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .opacity(0.58)
                
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color("9C36FF"), lineWidth: 1)
            }
        }
        .overlay(alignment: .topTrailing) {
            Button {
                if isFavorited {
                    if let index = favoriteMoments.firstIndex(of: moment) {
                        favoriteMoments.remove(at: index)
                    }
                } else {
                    favoriteMoments.append(moment)
                }
            } label: {
                Image(isFavorited ? .heartOn : .heartOff)
                    .resizable()
                    .frame(width: 26, height: 26)
            }
            .padding(10)
        }
    }
}

#Preview {
    MomentCell(moment: .allMoments[0])
}
