import SwiftUI

struct AppNavigationBar: View {
    var controller: FeatureNavigationController?
    
    var body: some View {
        if let controller, (controller.hasDestinationToPop() || controller.hasDestinationToDismiss()) {
            HStack {
                Button(action: {
                    if controller.hasDestinationToPop() {
                        controller.pop()
                    } else if controller.hasDestinationToDismiss() {
                        controller.dismiss()
                    }
                }) {
                    if controller.hasDestinationToPop() {
                        HStack {
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .fontWeight(.medium)
                                .foregroundStyle(.appPrimary)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                            
                            Text("Voltar")
                                .foregroundStyle(.appText)
                                .appFont(.body)
                        }
                        .padding(0)
                        
                    } else if controller.hasDestinationToDismiss() {
                        
                        HStack {
                            Image(systemName: "xmark")
                                .resizable()
                                .fontWeight(.medium)
                                .foregroundStyle(.appPrimary)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                            
                            Text("Fechar")
                                .foregroundStyle(.appText)
                                .appFont(.body)
                        }
                        .padding(0)
                    }
                }
                
                Spacer()
            }
            .padding(0)
            .onAppear { 
                AppNavigationConfig.shared.popSwipeGestureEnabled = controller.hasDestinationToPop()
            }
        } else {
            EmptyView()
                .onAppear { 
                    AppNavigationConfig.shared.popSwipeGestureEnabled = false
                }
        }
    }
}

#Preview {
    AppNavigationBar(
        controller: .init(
            hasDestinationToPop: { true }, 
            hasDestinationToDismiss: { false }, 
            pop: { }, 
            dismiss: { }
        )
    )
}
