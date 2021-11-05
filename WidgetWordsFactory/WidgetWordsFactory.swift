//
//  WidgetWordsFactory.swift
//  WidgetWordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(date: Date(), totalWords: 0, learnedWords: 0)
  }
  
  func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
    let entry = SimpleEntry(date: Date(), totalWords: 0, learnedWords: 0)
    completion(entry)
  }
  
  func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
    var entries: [SimpleEntry] = []
    
    let totalWords = UserDefaults(suiteName: "group.com.words-factory")?.value(forKey: "total") as? Int ?? 0
    let learnedWords = UserDefaults(suiteName: "group.com.words-factory")?.value(forKey: "learned") as? Int ?? 0
    
    let currentDate = Date()
    for hourOffset in 0 ..< 5 {
      let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
      let entry = SimpleEntry(date: entryDate, totalWords: totalWords, learnedWords: learnedWords)
      entries.append(entry)
    }
    
    let timeline = Timeline(entries: entries, policy: .atEnd)
    completion(timeline)
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let totalWords: Int
  let learnedWords: Int
}

struct WidgetWordsFactoryEntryView : View {
  var entry: Provider.Entry
  @Environment(\.widgetFamily) var widgetFamily
  
  var body: some View {
    switch widgetFamily {
    case .systemMedium:
      VStack(alignment: .leading) {
        Text("WordsFactory")
          .font(.bold(32))
          .foregroundColor(.white)
          .padding(.vertical, 5)
          .padding(.horizontal, 16)
          .frame(maxWidth: .infinity, alignment: .leading)
          .background( LinearGradient(colors: [.red, .yellow],
                                      startPoint: .leading, endPoint: .trailing))
          .padding(.top, -5)
        VStack(spacing: 16) {
          HStack {
            Text("My Dictionary")
              .font(.medium(20))
              .foregroundColor(.black)
            Spacer()
            Text("\(entry.totalWords) words")
              .font(.regular(14))
              .foregroundColor(.black.opacity(0.5))
          }
          HStack {
            Text("I already remember ")
              .font(.medium(20))
              .foregroundColor(.black)
            Spacer()
            Text("\(entry.learnedWords) words")
              .font(.regular(14))
              .foregroundColor(.black.opacity(0.5))
          }
        }.padding(16)
      }
    default:
      Text("")
    }
  }
}

@main
struct WidgetWordsFactory: Widget {
  let kind: String = "WidgetWordsFactory"
  
  var body: some WidgetConfiguration {
    StaticConfiguration(kind: kind, provider: Provider()) { entry in
      WidgetWordsFactoryEntryView(entry: entry)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
  }
}
