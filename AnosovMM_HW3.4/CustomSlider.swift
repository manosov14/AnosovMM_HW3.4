//
//  CustomSlider.swift
//  AnosovMM_HW3.4
//
//  Created by Михаил on 20.09.2021.
//

import SwiftUI

struct CustomSlider: UIViewRepresentable {
    @Binding var value: Double
    
    let color: UIColor
    let alpha: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
}

extension CustomSlider {
    
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
    
    
}
