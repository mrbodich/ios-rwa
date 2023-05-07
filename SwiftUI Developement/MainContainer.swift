import SwiftUI

struct MainContainer: View {
    let rewardsClientFabric: RewardsClientFabric
    
	var body: some View {
		TabView {
            RewardsView(clientFabric: rewardsClientFabric)
                .tabItem {
                    tabLabel("Rewards", image: "Rewards")
                }
			Account()
				.tabItem {
                    tabLabel("Account", image: "Account")
				}
		}
        .accentColor(.accentColor)
    }
    
    private func tabLabel(_ title: String, image: String) -> some View {
        Label {
            Text(title)
        } icon: {
            Image(image)
                .renderingMode(.template)
        }
    }
}

struct MainContainer_Previews: PreviewProvider {
	static var previews: some View {
        MainContainer(rewardsClientFabric: MockRewardsClientFabric(delay: 1))
            .exhaustivePreview()
    }
}
