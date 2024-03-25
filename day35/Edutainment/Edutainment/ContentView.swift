//
//  ContentView.swift
//  Edutainment
//
//  Created by jason on 3/17/24.
//

import SwiftUI

struct TimesTable: View {
    var title: String
    var table: Int
    var action: (Int) -> Void
    var color: Color
    
    var body: some View {
        
        Button(title) {
            action(table)
        }
        .frame(width: 120, height: 50)
        .background(color)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: 5))
    }
}

struct ContentView: View {
    @State private var selectedTable = 0
    @State private var questions = [String]()
    @State private var answers = [Int]()
    
    @State private var answer = 0
    
    var body: some View {
        ScrollView {
            VStack {
                Text("not too interested in this project, finish later") // MARK: - Fix Me
                    .font(.largeTitle.bold())
                
                VStack {
                    HStack {
                        TimesTable(title: "1 Times Table", table: 1, action: testTimesTable, color: .blue)
                        TimesTable(title: "2 Times Table", table: 2, action: testTimesTable, color: .brown)
                        TimesTable(title: "3 Times Table", table: 3, action: testTimesTable, color: .cyan)
                    }
                    HStack {
                        TimesTable(title: "4 Times Table", table: 4, action: testTimesTable, color: .green)
                        TimesTable(title: "5 Times Table", table: 5, action: testTimesTable, color: .indigo)
                        TimesTable(title: "6 Times Table", table: 6, action: testTimesTable, color: .mint)
                    }
                    HStack {
                        TimesTable(title: "7 Times Table", table: 7, action: testTimesTable, color: .orange)
                        TimesTable(title: "8 Times Table", table: 8, action: testTimesTable, color: .pink)
                        TimesTable(title: "9 Times Table", table: 9, action: testTimesTable, color: .purple)
                    }
                    HStack {
                        TimesTable(title: "10 Times Table", table: 10, action: testTimesTable, color: .red)
                        TimesTable(title: "11 Times Table", table: 11, action: testTimesTable, color: .teal)
                        TimesTable(title: "12 Times Table", table: 12, action: testTimesTable, color: .yellow)
                    }
                }
                
                Spacer()
                
                if selectedTable != 0 {
                    VStack {
                        ForEach(questions, id: \.self) { question in
                            HStack {
                                Text(question)
                                
                                TextField("", value: $answer, format: .number)
                                    .frame(width: 50)
                                    .textFieldStyle(.roundedBorder)
                            }
                        }
                    }
                    
                    Button("Check Answers") {
                        
                    }
                }
                
            }
        }
    }
    
    func testTimesTable(for timesTable: Int) {
        
        questions.removeAll()
        answers.removeAll()
        selectedTable = timesTable
        
        for i in 1...12 {
            questions.append("\(i) x \(selectedTable) = ")
            answers.append(i * selectedTable)
        }
    }
}

#Preview {
    ContentView()
}
