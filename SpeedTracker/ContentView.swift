//
//  ContentView.swift
//  SpeedTracker
//
//  Created by Yen Hung Cheng on 2023/7/17.
//

import SwiftUI
import MapKit
import CoreLocation


struct ContentView: View {
    
    // 創建 LocationManager 的狀態物件，用於處理位置資訊
    @StateObject private var locationManager = LocationManager()
    
    private var region: Binding<MKCoordinateRegion> {
        Binding {
            locationManager.region
        } set: { region in
            DispatchQueue.main.async {
                locationManager.region = region
            }
        }
    }
    
    private var tracking: Binding<MapUserTrackingMode> {
        Binding {
            locationManager.tracking
        } set: { tracking in
            DispatchQueue.main.async {
                locationManager.tracking = tracking
            }
        }
    }
    
    
    // 格式化後的速度字符串，從 LocationManager 中取得速度資訊
    var speed: String {
        // 用 max 函數將速度限制為最小為 0
        let clampedSpeed = max(locationManager.speedInKmPerHour, 0)
        return String(format: "%.0f", clampedSpeed)
    }
    // 從 LocationManager 中取得的緯度和經度的字串表示
    var latitude: String {
        locationManager.latitude
    }
    var longitude: String {
        locationManager.longitude
    }
    
    var body: some View {
        VStack {
            ZStack {
                // 顯示地圖，啟動位置更新並跟蹤使用者位置
                Map(coordinateRegion: region, interactionModes: .all, showsUserLocation: true, userTrackingMode: tracking)
                    .task {
                        // 要求使用者授權使用位置資訊
                        locationManager.requestAuthorization()
                        // 開始更新位置
                        locationManager.startUpdatingLocation()
                        // 設定地圖追蹤模式為跟蹤使用者位置
                        DispatchQueue.main.async {
                            locationManager.tracking = .follow
                        }
                    }
                .ignoresSafeArea()
                // 顯示定位的 Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                            .frame(width: 15)
                        Button {
                            DispatchQueue.main.async {
                                locationManager.tracking = .follow
                            }
                        } label: {
                            Image(systemName: locationManager.tracking == .follow ? "location.fill" : "location")
                        }
                        .font(.headline)
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(10)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 30)
                }
                
            }
            
            HStack {
                // 顯示自定義的速度計視圖，角度和速度資訊根據速度計算
                SpeedViewModel(frameHeight: 150, angle: 220.0 + Double(2 * (Double(speed) ?? 0.0)) - 0.0, speedText: speed)
                    .frame(height: 150)
                
                VStack(alignment: .leading, spacing: 20) {
                    // 顯示緯度和經度的資訊
                    Text("latitude : \n\(latitude)")
                    Text("longitude : \n\(longitude)")
                }
                .frame(maxWidth: 400, alignment: .leading)
                .font(.title3)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
