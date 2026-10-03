//
//  ContentView.swift
//  MarksApp
//
//  Created for SE4041 Practical 04.
//

import SwiftUI

struct ContentView: View {
    @State private var students: [Student] = [
        Student(name: "Amal", mark: 72),
        Student(name: "Nimali", mark: 45),
        Student(name: "Ruwan", mark: 58)
    ]

    @State private var studentName = ""
    @State private var markText = ""

    // Total number of students who have passed (mark >= 50)
    private var passedStudentsCount: Int {
        students.filter { $0.passed }.count
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                // Input Section
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Student Name", text: $studentName)
                        .textFieldStyle(.roundedBorder)

                    TextField("Mark", text: $markText)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)

                    Button("Add Student") {
                        addStudent()
                    }
                    .buttonStyle(.borderedProminent)
                    .frame(maxWidth: .infinity)

                    HStack {
                        Text("Passed Students: \(passedStudentsCount)")
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Spacer()
                    }
                    .padding(.top, 4)
                }
                .padding(.horizontal)
                .padding(.top, 8)

                // Students List
                List {
                    ForEach(students) { student in
                        NavigationLink {
                            StudentDetailView(student: student)
                        } label: {
                            HStack {
                                Text(student.name)
                                    .font(.body)

                                Spacer()

                                Text("\(student.mark)")
                                    .bold()
                                    .foregroundStyle(student.passed ? .green : .red)
                            }
                        }
                    }
                    .onDelete(perform: deleteStudent)
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("SE4041 Marks")
        }
    }

    private func addStudent() {
        let trimmedName = studentName.trimmingCharacters(in: .whitespaces)
        guard !trimmedName.isEmpty else {
            return
        }

        guard let mark = Int(markText.trimmingCharacters(in: .whitespaces)) else {
            return
        }

        guard mark >= 0 && mark <= 100 else {
            return
        }

        let student = Student(
            name: trimmedName,
            mark: mark
        )

        students.append(student)

        studentName = ""
        markText = ""
    }

    private func deleteStudent(at offsets: IndexSet) {
        students.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
