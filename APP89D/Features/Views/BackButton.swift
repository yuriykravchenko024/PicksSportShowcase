import SwiftUI

struct BackButton: View {
    @Environment(\.goBack) var goBack
    
    var body: some View {
        Button {
            goBack()
        } label: {
            ZStack {
                Circle()
                    .fill(LinearGradient(colors: [Color("6D00AF"), Color("7E1DDF")], startPoint: .leading, endPoint: .trailing))
                
                Circle()
                    .strokeBorder(LinearGradient(colors: [Color("9C37FF"), Color("9C37FF")], startPoint: .top, endPoint: .bottom), lineWidth: 1)
                
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)
                    .padding(10)
            }
            .frame(width: 40, height: 40)
        }
    }
}

#Preview {
    BackButton()
}
