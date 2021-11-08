//
//  DictionaryView.swift
//  WordsFactory
//
//  Created by Кристина Перегудова on 05.11.2021.
//

import SwiftUI

struct DictionaryView: View {
  @ObservedObject var viewModel: DictionaryViewModel
  var body: some View {
    
    ZStack(alignment: .bottom) {
      Color.white.edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      VStack(alignment: .leading) {
        HStack {
          TextField("", text: $viewModel.searchText)
            .padding(16)
            .font(.regular(14))
            .foregroundColor(.incGray)
          Button {
            viewModel.search()
          } label: {
            Image("search")
              .resizable()
              .frame(width: 24, height: 24)
              .padding(.trailing, 16)
          }
        }.overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Color.incGray, lineWidth: 1)
        ).padding(.horizontal, 16)
        
        if viewModel.showEmptyPlaceholder {
          VStack {
            Spacer()
            Image("empty")
            VStack(spacing: 8) {
              Text("No word")
                .foregroundColor(.inc)
                .font(.medium(24))
                .multilineTextAlignment(.center)
              
              Text("Input something to find it in dictionary")
                .foregroundColor(.incGray)
                .font(.regular(14))
                .multilineTextAlignment(.leading)
            }.padding(.top, 32)
              .padding(.horizontal, 17)
            Spacer()
          }
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.words, id: \.id) { word in
              WordView(word: word, play: {
                viewModel.playPhonetic(with: word.phonetics.first?.audio ?? "")
              })
            }
          }.padding(.horizontal, 16)
        }
      }
      if !viewModel.showEmptyPlaceholder {
        Button {
          viewModel.addToDictionary()
        } label: {
          Text("Add to Dictionary")
            .foregroundColor(.white)
            .font(.medium(16))
            .padding(.vertical, 16)
            .padding(.horizontal, 32)
            .frame(maxWidth: .infinity)
            .background(Color.accent)
            .cornerRadius(16)
        }.padding(.horizontal, 33)
          .frame(maxHeight: 56)
      }
    }
  }
}


struct WordView: View {
  @State var word: Word
  @State var play: (() -> Void)
  
  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack(spacing: 16) {
        Text(word.word ?? "")
          .foregroundColor(.black)
          .font(.medium(14))
        if let phonetic = word.phonetics.first?.text, !phonetic.isEmpty {
          Text("[" + phonetic + "]")
            .foregroundColor(.accent)
            .font(.regular(14))
        }
        if let url = word.phonetics.first?.audio, !url.isEmpty {
          Button {
            play()
          } label: {
            Image("audio")
          }
        }
        Spacer()
      }
      HStack(spacing: 16) {
        Text("Part of Speech:")
          .font(.medium(20))
        Text(word.meanings.first?.partOfSpeech ?? "")
          .font(.regular(14))
      }.foregroundColor(.black)
      
      VStack(alignment: .leading, spacing: 10) {
        ForEach(word.meanings, id: \.id) { meaning in
          ForEach(meaning.definitions, id: \.id) { definition in
            VStack(alignment: .leading, spacing: 8) {
              Text(definition.definition ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .foregroundColor(.black)
                .font(.regular(14))
              
              if let example = definition.example {
                HStack(spacing: 0) {
                  Text("Example: ")
                    .foregroundColor(.lightBlue)
                    .font(.regular(14))
                  Text(example)
                    .foregroundColor(.black)
                    .font(.regular(14))
                    .multilineTextAlignment(.leading)
                }
              }
            }.padding(16)
              .frame(maxWidth: .infinity)
              .overlay(
                RoundedRectangle(cornerRadius: 16)
                  .stroke(Color.incGray, lineWidth: 1)
              )
          }
        }
      }
    }
  }
}
