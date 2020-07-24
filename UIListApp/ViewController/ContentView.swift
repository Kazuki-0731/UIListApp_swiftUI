//
//  ContentView.swift
//  UIListApp
//
//  Created by Kazuki on 2020/07/24.
//  Copyright © 2020 susu. All rights reserved.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                // NOTE: NavigationLinkはNavigationViewの内側でなければならない
                NavigationLink(destination: SubView()) {
                    // NOTE: Labelを指定すると遷移先へのリンクが自動的に生成される
                    Text("Move to SubView")
                }
            }
        }
    }
}

struct SubView: View {
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()

    var body: some View {
            VStack{
                ZStack {
                    MapView(centerCoordinate: $centerCoordinate, annotations: locations)
                        .edgesIgnoringSafeArea(.all)
                    Circle()
                        .fill(Color.blue)
                        .opacity(0.5)
                        .frame(width: 32, height: 32)
                        .padding(.bottom)
                        .padding(.bottom)
                }

                ZStack {
                    CircleImage()
                        .offset(y: -90)
                        .padding(.bottom, -130)
                }

                HStack {
                    Spacer()
                    Button(action: {
                        // create a new location
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                    }) {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(Color.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }

                VStack(alignment: .leading) {
                    Text("Mizuho Suzuki")
                        .font(.title)
                    HStack(alignment: .top) {
                        Text("Jocy, Inc.")
                            .font(.subheadline)
                        Spacer()
                        Text("Tokyo")
                            .font(.subheadline)
                    }
                }
                .padding()
            }
        // NOTE: navigationBarに関連するModifierはNavigationViewのSubviewでなければならない
        .navigationBarTitle("SubView")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
