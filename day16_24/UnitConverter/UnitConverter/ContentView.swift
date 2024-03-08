//
//  ContentView.swift
//  UnitConverter
//
//  Created by jason on 3/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var temperature = 0.0
    @State private var fromConversion = "Celsius"
    @State private var toConversion = "Celsius"
    @FocusState private var temperatureIsFocused: Bool
    
    let conversions = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var convertedTemperature: Double {
        switch fromConversion {
        case "Celsius":
            switch toConversion {
            case "Fahrenheit":
                return temperature * (9 / 5) + 32
            case "Kelvin":
                return temperature + 273.15
            default:
                return temperature
            }
        case "Fahrenheit":
            switch toConversion {
            case "Celsius":
                return (temperature - 32) * (5 / 9)
            case "Kelvin":
                return (temperature - 32) * (5 / 9) + 273.15
            default:
                return temperature
            }
        case "Kelvin":
            switch toConversion {
            case "Celsius":
                return temperature - 273.15
            case "Fahrenheit":
                return (temperature - 273.15) * (9 / 5) + 32
            default:
                return temperature
            }
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Convert units from") {
                    Picker("Temperature", selection: $fromConversion) {
                        ForEach(conversions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("0°", value: $temperature, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($temperatureIsFocused)
                }
                
                Section("Convert units to") {
                    Picker("Temperature", selection: $toConversion) {
                        ForEach(conversions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(convertedTemperature.rounded(), format: .number)
                }
            }
            .navigationTitle("Temperature Converter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if temperatureIsFocused {
                    Button("Done") {
                        temperatureIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
