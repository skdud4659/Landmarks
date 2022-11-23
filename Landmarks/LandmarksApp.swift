//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Nayeong Kim on 2022/11/22.
//

import SwiftUI

// body 속성은 하나 이상의 장면을 반환하며 차례로 표시할 콘텐츠를 제공
// 속성은 @main 앱의 진입점을 식별
@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            // 시뮬레이터나 기기에서 앱을 실행할 때 환경에 모델 개체를 배치하도록 인스턴스를 업데이트.
                .environmentObject(modelData)
        }
    }
}
