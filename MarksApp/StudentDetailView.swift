//
//  StudentDetailView.swift
//  MarksApp
//
//  Created for SE4041 Practical 04.
//

import SwiftUI

struct StudentDetailView: View {
    let student: Student

    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(student.passed ? .green : .red)
                .padding(.top, 20)

            VStack(spacing: 8) {
                Text(student.name)
                    .font(.largeTitle)
                    .bold()

                Text("Mark: \(student.mark)")
                    .font(.title2)
                    .foregroundStyle(.secondary)

                Text("Grade: \(student.grade)")
                    .font(.title2)
                    .bold()
            }

            Text(student.passed ? "Pass" : "Fail")
                .font(.title)
                .bold()
                .foregroundStyle(student.passed ? .green : .red)
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                .background(
                    (student.passed ? Color.green : Color.red)
                        .opacity(0.15)
                )
                .clipShape(Capsule())

            Spacer()
        }
        .padding()
        .navigationTitle("Student Details")
    }
}

#Preview {
    NavigationStack {
        StudentDetailView(student: Student(name: "Amal", mark: 72))
    }
}
