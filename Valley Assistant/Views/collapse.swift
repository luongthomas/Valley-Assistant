import SwiftUI

struct MenuView: View {
    var body: some View {
        HStack {
            List {
                ToggleableMenuItemsView(sections: menuItems)
                .padding()
                ToggleableMenuItemsView(sections: menuItems)
                .padding()
            }
        }
        .background(Color("Gray"))
        .cornerRadius(30)
//        .padding(.top, 30)
//        .padding(.trailing, bounds.width * 0.2)
        .padding(.bottom, 30)
        .shadow(radius: 10)
    }

    @State var menuItemState = [String: Bool]()
    private var bounds: CGRect { UIScreen.main.bounds }

    private func isExpanded(_ menuItem: MenuItem) -> Bool {
        menuItemState[menuItem.id] ?? false
    }
}

struct ToggleableMenuItemsView: View {
    let sections: [MenuItem]

    var body: some View {
        ForEach(sections) { section in
            Section(
                header: Text(section.title)
                    .font(.title)
                    .onTapGesture { self.menuItemState[section.id] = !self.isExpanded(section) },
                content: {
                    if self.isExpanded(section) {
                        ForEach(section.children) { subsection in
                            Section(
                                header: Text(subsection.title)
                                    .font(.headline)
                                    .onTapGesture { self.menuItemState[subsection.id] = !self.isExpanded(subsection) },
                                content: {
                                    if self.isExpanded(subsection) {
                                        LessonsListView(lessons: subsection.children)
                                    }
                                }
                            )
                        }
                    }
                }
            )
        }
    }

    @State var menuItemState = [String: Bool]()

    private func isExpanded(_ menuItem: MenuItem) -> Bool {
        menuItemState[menuItem.id] ?? false
    }
}

struct LessonsListView: View {
    let lessons: [MenuItem]

    var body: some View {
        ForEach(lessons) { lesson in
            Text(lesson.title)
                .font(.subheadline)
        }
    }
}

class MenuItem: Identifiable {
    var id: String
    let title: String
    var children: [MenuItem]

    init(id: String, title: String, children: [MenuItem] = []) {
        self.id = id
        self.title = title
        self.children = children
    }
}

let menuItems = [
    MenuItem(
        id: "01",
        title: "The Land in its World",
        children: [
            MenuItem(
                id: "01A",
                title: "North and South",
                children: [
                    MenuItem(
                        id: "01A01",
                        title: "Between Continents"
                    ),
                    MenuItem(
                        id: "01A02",
                        title: "The Wet North"
                    ),
                    MenuItem(
                        id: "01A03",
                        title: "The Dry South"
                    ),
                    MenuItem(
                        id: "01A04",
                        title: "Between Wet and Dry"
                    )
                ]
            ),
            MenuItem(
                id: "01B",
                title: "East and West",
                children: [
                    MenuItem(
                        id: "01B01",
                        title: "Sea and Desert"
                    ),
                    MenuItem(
                        id: "01B02",
                        title: "Exchange in Aram"
                    ),
                    MenuItem(
                        id: "01B03",
                        title: "Exchange in Egypt"
                    ),
                    MenuItem(
                        id: "01B04",
                        title: "A Bypass Between"
                    )
                ]
            ),
            MenuItem(
                id: "01C",
                title: "Between Empires",
                children: [
                    MenuItem(
                        id: "01C01",
                        title: "Imperial Dreams"
                    ),
                    MenuItem(
                        id: "01C02",
                        title: "Egypt Marches"
                    ),
                    MenuItem(
                        id: "01C03",
                        title: "Taking Egypt's Wealth"
                    ),
                    MenuItem(
                        id: "01C04",
                        title: "The Land Between"
                    )
                ]
            )
        ]
    )
]

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
