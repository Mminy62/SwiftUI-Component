//
//  KakaoMapTestApp.swift
//  KakaoMapTest
//
//  Created by 이민영 on 10/10/24.
//

import SwiftUI
import KakaoMapsSDK
@main
struct KakaoMapTestApp: App {
    init(){
        let kakaoNativeAppKey = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] as? String ?? ""
        SDKInitializer.InitSDK(appKey: kakaoNativeAppKey)
    }
    
    @StateObject private var locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationManager)
        }
    }
}
