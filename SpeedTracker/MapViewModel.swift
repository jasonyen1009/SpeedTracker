//
//  MapViewModel.swift
//  SpeedTracker
//
//  Created by Yen Hung Cheng on 2023/8/8.
//

import SwiftUI
import MapKit
//import UIKit


struct MapViewModel: View {
    
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.3769, longitude: 8.5417), latitudinalMeters: 2000, longitudinalMeters: 2000)
    
    @State var tracking = MapUserTrackingMode.follow // 初始值改為 follow
    
    @StateObject private var locationManager = LocationManager()

    // 目前的時速
    var mySpeed: Int = 0
    
    var speed: String {
        String(format: "%.0f", locationManager.speedInKmPerHour)
    }
    
    var latitude: String {
        locationManager.latitude
    }

    var longitude: String {
        locationManager.longitude
    }
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: $tracking)
                .task {
                    locationManager.requestAuthorization()
                    locationManager.startUpdatingLocation() // 啟動位置更新
                    tracking = .follow // 在初始畫面上開始追蹤
                }
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                        .frame(width: 50)
                    Button {
                        
                    } label: {
                        Image(systemName: tracking == .follow ? "location.fill" : "location")
                    }
                    .font(.headline)
                    .padding(8) // 添加内边距
                    .background(Color.white) // 设置背景颜色为白色
                    .cornerRadius(10)
                    Spacer()
                }
            }

            
//            HStack {
//                SpeedViewModel(frameHeight: 150, angle: 220.0 + Double(2 * (Double(speed) ?? 0.0)) - 0.0, speedText: speed)
//                    .frame(height: 150)
//
//                VStack(alignment: .leading, spacing: 20) {
//                    Text("latitude : \n\(latitude)")
//                    Text("longitude : \n\(longitude)")
//                }
//                .frame(maxWidth: 400, alignment: .leading)
//                .font(.title3)
//            }

            
            
        }
    }
}



struct MapViewModel_Previews: PreviewProvider {
    static var previews: some View {
        MapViewModel()
    }
}
