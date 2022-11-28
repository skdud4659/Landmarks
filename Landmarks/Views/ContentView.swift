//
//  ContentView.swift
//  Landmarks
//
//  Created by Nayeong Kim on 2022/11/22.
//

import SwiftUI

// 콘텐츠 및 레이아웃을 설명
struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

// 해당 보기에 대한 미리보기를 선언
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // 환경에 모델 객체를 추가하면 모든 하위 보기에서 객체를 사용할 수 있음.
            .environmentObject(ModelData())
    }
}
