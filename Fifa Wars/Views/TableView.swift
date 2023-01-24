//
//  TableView.swift
//  Fifa Wars
//
//  Created by Sharma McGavin on 18/01/2023.
//

//import SwiftUI
//
//struct TableView: View {
//    @State private var sampleTable = Player.sample.sorted(using: KeyPathComparator(\.points))
//    @State private var sortOrder = [KeyPathComparator(\Player.points)]
//    @State private var selection: Player.ID?
//    @State private var path = [Player]()
//    @Environment(\.horizontalSizeClass) var sizeClass
//    @State private var ascend = true
//
//    var body: some View {
//        NavigationStack(path: $path) {
//            VStack(alignment: .leading){
//                Text("Fifa Wars Standings")
//                    .font(.largeTitle)
//                    .bold()
//                    .padding(.bottom)
//
//                if sizeClass == .compact {
//                    Button {
//                        ascend.toggle()
//                        if ascend {
//                            sampleTable.sort {$0.username < $1.username}
//                        } else {
//                            sampleTable.sort {$0.username > $1.username}
//                        }
//                    } label: {
//                        Text(ascend ? "Sort \(Image(systemName: "arrowtriangle.down"))" : "Sort \(Image(systemName: "arrowtriangle.up"))")
//                    }
//                    .buttonStyle(.bordered)
//                }
//
//                Table(sampleTable, selection: $selection, sortOrder: $sortOrder) {
//                    TableColumn("Name", value: \.username) { Player in
//                        HStack {
//                            Text(Player.username)
//                            Spacer()
//                            if sizeClass == .compact {
//                                HStack {
//                                    Text(Player.points)
//                                    Text(Player.goals)
//                                }
//                            }
//                        }
//                    }
//                    TableColumn("Goals", value: \.goals) { Player in
//                        Text("\(Player.goals)")
//                    }
//                    TableColumn("Points", value: \.points) { Player in
//                        Text("\(Player.points)")
//                    }
//                }
//            }
//            //Vstack
//            .padding()
//            .navigationDestination(for: Player.self) { player in
//                sampleTable(player: Player)
//            }
//            .onAppear {
//                selection = nil
//            }
//        }
//        .onChange(of: sortOrder) { newOrder in
//            sampleTable.sort(using: newOrder)
//        }
//        .onChange(of: selection) { selection in
//            if let selection = selection,
//                let player = sampleTable.first(where: {$0.id == selection}) {
//                    path.append(player)
//                }
//            }
//        }
//}
//
//        //navigationStack
//struct TableView_Previews: PreviewProvider {
//    static var previews: some View {
//        TableView()
//    }
//}
