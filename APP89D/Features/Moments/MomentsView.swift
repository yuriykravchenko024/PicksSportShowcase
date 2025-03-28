import SwiftUI

struct MomentsView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Historic\nMoments")
                .font(.ADLaMDisplay(size: 25))
                .foregroundStyle(.white)
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
            
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    ForEach(Moment.allMoments) { moment in
                        NavigationLink {
                            MomentDetailView(moment: moment)
                        } label: {
                            MomentCell(moment: moment)
                        }
                        .id(moment.id)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    MomentsView()
}
