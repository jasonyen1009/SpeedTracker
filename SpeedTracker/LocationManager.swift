//
//  LocationManager.swift
//  SpeedTracker
//
//  Created by Yen Hung Cheng on 2023/8/12.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {

    // 創建 CLLocationManager 實例以進行位置信息管理
    private var locationManager = CLLocationManager()
    
    // 使用 @Published 屬性監聽位置信息的改變，這些屬性將在視圖中自動更新
    @Published var location: CLLocation?
    @Published var speedInMetersPerSecond: Double = 0.0
    @Published var speedInKmPerHour: Double = 0.0
    @Published var latitude: String = ""
    @Published var longitude: String = ""

    // 地圖區域的設定，初始位置位於瑞士茵特拉根的座標
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.3769, longitude: 8.5417), latitudinalMeters: 2000, longitudinalMeters: 2000)
    // 地圖的追蹤模式，初始設定為跟蹤使用者
    @Published var tracking = MapUserTrackingMode.follow
    
    override init() {
        super.init()
        
        // 設置 CLLocationManager 的屬性和委派
        locationManager.delegate = self
        // 設定位置精度，這將影響定位的準確程度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 設定定位活動類型，以便系統更好地適應定位的需要
        locationManager.activityType = .automotiveNavigation
        // 設置位置更新的觸發距離，每 3 米更新一次
        locationManager.distanceFilter = 3.0
    }

    // 要求使用者授予應用程式在使用時的位置權限
    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    // 開始監聽位置信息的更新
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    // 停止監聽位置信息的更新
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }

    // CLLocationManagerDelegate 方法，當位置信息更新時呼叫
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // 更新最新的位置信息
        location = locations.first
        latitude = "\(locations[0].coordinate.latitude)"
        longitude = "\(locations[0].coordinate.longitude)"
        print(locations[0].coordinate.latitude)
        print(locations[0].coordinate.longitude)
        
        // 獲取最新位置的速度信息
        if let location = locations.last {
            // 獲取速度（以米/秒為單位）
            let speed = location.speed
            self.speedInMetersPerSecond = speed
            self.speedInKmPerHour = speed * 3.6 // 將速度轉換為千米/小時
        }
    }
}
