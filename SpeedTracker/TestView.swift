//
//  TestView.swift
//  SpeedTracker
//
//  Created by Yen Hung Cheng on 2023/8/2.
//

import SwiftUI

//struct TestView: View {
//
//    var frameHeight: CGFloat = 150.0
//
//    let angle: Double
//
//    let speedText: String
//    // 指針顏色
//    var color: Color = Color.black
//
//    var body: some View {
//        ZStack {
//
//            // 細的刻度
//            TickMarks()
//                .stroke(color, lineWidth: 3)
//                .rotationEffect(Angle(degrees: -70))
//                .frame(width: frameHeight)
//            // 粗的刻度
//            TickMarks(test: 40, tickLength: 20.0)
//                .stroke(color, lineWidth: 5)
//                .rotationEffect(Angle(degrees: -70))
//                .frame(width: frameHeight)
//
//
//            // 製作 時速 Label
//            GeometryReader { geometry in
//                ForEach(0..<8) { index in
//                    SpeedLabel(speed: index * 20, radius: (frameHeight / (returnRadius(for: frameHeight))), size: geometry.size)
//                }
//            }
//
//            Triangle(height: frameHeight)
//                .fill(Color.red)
//                .frame(width: 10, height: 100) // 調整指針的高度和寬度
//                .rotationEffect(Angle(degrees: angle))
//                // 製作指針上下擺動的特效
//                .animation(.spring(dampingFraction: 0.5))
//
//
//            Circle()
//                .fill(Color.gray)
//                .frame(width: 20, height: 20)
//            // 表速度
//            VStack {
//                Spacer()
//                    .frame(height: frameHeight - 50)
//                Text(speedText)
//                    .font(.title3)
//            }
//        }
//    }
//
//    // 根據不同的 frame 回傳不同的 值
//    func returnRadius(for frame: Double) -> Double {
//        let frameValues: [Double] = [150, 200, 300]
//        let heightValues: [Double] = [4, 3, 2.7]
//
//        // 找到 frame 值所處的區間
//        for i in 0..<frameValues.count - 1 {
//            if frame >= frameValues[i] && frame <= frameValues[i + 1] {
//                let x0 = frameValues[i]
//                let x1 = frameValues[i + 1]
//                let y0 = heightValues[i]
//                let y1 = heightValues[i + 1]
//
//                // 進行線性插值計算
//                let height = y0 + (y1 - y0) * (frame - x0) / (x1 - x0)
//                return height
//            }
//        }
//
//        // 如果超出 300 ，一律回傳 2.7
//        return 2.7
//    }
//}
//
//// 刻度
//struct TickMarks: Shape {
//
//    var test: Double = 10.0
//    var tickLength: CGFloat = 10.0
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let radius = rect.width / 2.0
//        let center = CGPoint(x: rect.midX, y: rect.midY) // 將圓心設置在畫面的中心
//
//        for angle in stride(from: -140.0, through: 140.0, by: test) {
//            let tickAngle = angleToRadian(angle - 20)
//            let startPoint = CGPoint(
//                x: center.x + (radius - tickLength) * cos(tickAngle),
//                y: center.y + (radius - tickLength) * sin(tickAngle)
//            )
//            let endPoint = CGPoint(
//                x: center.x + radius * cos(tickAngle),
//                y: center.y + radius * sin(tickAngle)
//            )
//            path.move(to: startPoint)
//            path.addLine(to: endPoint)
//        }
//
//        return path
//    }
//
//    private func angleToRadian(_ angle: Double) -> CGFloat {
//        return CGFloat(angle) * .pi / 180.0
//    }
//}
//
//// 時速
//struct SpeedLabel: View {
//    let speed: Int
//    var radius: CGFloat = 100.0 // 調整標籤距離中心點的距離
//    let size: CGSize // 父視圖的大小
//
//    var body: some View {
//        let angle = Double(speed) / 160.0 * 320.0  + 130// 修改弧度範圍為 0 到 280 度
//        let center = CGPoint(x: size.width / 2, y: size.height / 2) // 將圓心設置在畫面的中間
//
//        let labelAngle = angleToRadian(angle)
//        let x = center.x + radius * cos(labelAngle)
//        let y = center.y + radius * sin(labelAngle)
//
//        return Text("\(speed)")
//            .position(CGPoint(x: x, y: y))
//    }
//
//    private func angleToRadian(_ angle: Double) -> CGFloat {
//        return CGFloat(angle) * .pi / 180.0
//    }
//}
//
//
//struct Triangle: Shape {
//
//    var height = 350.0
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        path.move(to: CGPoint(x: rect.midX, y: rect.minY - ((height / 5) - 10.0)))
//        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - 50))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - 50))
//        path.closeSubpath()
//        return path
//    }
//
//}
//
//
//struct TestView_Previews: PreviewProvider {
//    static var previews: some View {
//        TestView(angle: 220.0, speedText: "0")
//    }
//}
