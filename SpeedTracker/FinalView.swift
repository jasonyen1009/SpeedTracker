//
//  FinalView.swift
//  SpeedTracker
//
//  Created by Yen Hung Cheng on 2023/8/7.
//

//import SwiftUI
//import CoreLocation
////import Combine
//
//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//
//    private let locationManager = CLLocationManager()
//    @Published var speedInMetersPerSecond: Double = 0.0
//    @Published var speedInKmPerHour: Double = 0.0
//
//
//    override init() {
//        super.init()
//
//        self.locationManager.delegate = self
//        self.locationManager.requestWhenInUseAuthorization()
//        self.locationManager.startUpdatingLocation()
//
//        // 设置精度为最佳（可能会消耗更多电池）
//        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//
//        // 设置最小距离间隔，例如每 10 米更新一次
//        self.locationManager.distanceFilter = 3.0
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        // 获取最新的位置信息
//        if let location = locations.last {
//            // 获取速度
//            let speed = location.speed
//            self.speedInMetersPerSecond = speed
//            self.speedInKmPerHour = speed * 3.6
//        }
//    }
//}
//
//struct FinalView: View {
//
//
//
//    @State var contentSpeed = "0"
//    // 控制 指針的旋轉角度
//    @State private var pointerAngle: Double = 220.0
//    // 目前的時速
//    var mySpeed: Int = 0
//
//    //
//    @ObservedObject var locationManager = LocationManager()
//
//    //
//    var speed: String {
//        String(format: "%.0f", locationManager.speedInKmPerHour)
//    }
//
//
//    @State private var animationAmount = 1.0
//
//    var body: some View {
//        VStack {
////            Spacer()
////                .frame(height: 300)
//            // 時速表 畫面
//            TestView(frameHeight: 150, angle: 220.0 + Double(2 * (Double(speed) ?? 0.0)) - 0.0, speedText: speed)
////                .frame(width: 300)
////                .animation(.spring(dampingFraction: 0.5))
//
//
//            // 指針
////            PointerView(angle: 220.0 + Double(2 * (Double(speed) ?? 0.0)))
////                .frame(width: 300, height: 300)
////                .offset(y: 25)
////                .animation(.spring(dampingFraction: 0.5))
//
//
////            Circle()
////                .fill(Color.gray)
////                .frame(width: 20, height: 20)
////                .offset(y: 25)
//
//            // speedText
////            VStack {
////                Spacer()
////                    .frame(height: 200)
////                Text("\(speed)")
////                    .font(.largeTitle)
////            }
//
//
//
//
//        }
//    }
//
//
//}
//
//struct FinalView_Previews: PreviewProvider {
//    static var previews: some View {
//        FinalView()
//    }
//}
