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
	static let typeSizes: [DynamicTypeSize] = [
		.xSmall,
		.large,
		.xxxLarge
	]

	static var previews: some View {
		Group {
			ForEach(typeSizes, id: \.self) { size in
                MainContainer(rewardsClientFabric: MockRewardsClientFabric(delay: 1))
					.environment(\.dynamicTypeSize, size)
					.previewDisplayName("\(size)")
			}
			MainContainer(rewardsClientFabric: MockRewardsClientFabric(delay: 1))
				.background(Color(.systemBackground))
				.environment(\.colorScheme, .dark)
				.previewDisplayName("dark")
		}.previewLayout(.sizeThatFits)
    }
}
