//
//  Model.swift
//  Notes
//
//  Created by Алексей on 17.03.2021.
//

//Создание нескольких заметок - готово
//Удаление заметок - готово
//Сохранение заметок - готово
//По умолчанию - одна заметка должна быть - готово
//Редактирование заметок - не готово

import Foundation

var defaultNotesArray: [String] = ["Ваша первая заметка"]

var notesList: [Any] {
    set {
        UserDefaults.standard.setValue(newValue, forKey: "noteDataKey")
        UserDefaults.standard.synchronize()
    }
    get {
        if let loadedNotes = UserDefaults.standard.array(forKey: "noteDataKey") {
            return loadedNotes
        } else {
            return defaultNotesArray
        }
    }
}

func addNote(noteItem: String) {
    notesList.append(noteItem)
}

func removeNote(at index: Int) {
    notesList.remove(at: index)
}
