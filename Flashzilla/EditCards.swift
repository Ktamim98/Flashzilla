//
//  EditCards.swift
//  Flashzilla
//
//  Created by Tamim Khan on 8/5/23.
//

import SwiftUI

struct EditCards: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var cards = [Card]()
    @State private var newPrompt = ""
    @State private var newAns = ""
    
    
    var body: some View {
        NavigationView{
            List{
                Section("Add New Card"){
                    TextField("Prompt", text: $newPrompt)
                    TextField("Answer", text: $newAns)
                    Button("Add Card"){
                        addCard()
                        newPrompt = ""
                        newAns = ""
                    }
                       
                    
                }
                
                Section{
                    ForEach(0..<cards.count, id: \.self){ index in
                        VStack(alignment: .leading){
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                        
                    }
                    .onDelete(perform: removeCards)
                }
               
            }
            .navigationTitle("Edit Cards")
            .toolbar{
                Button("Done", action: done)
            }
            .listStyle(.grouped)
            .onAppear(perform: loadData)
        }
    }
    func done(){
        dismiss()
    }
    func loadData(){
        if let data = UserDefaults.standard.data(forKey: "Cards"){
            if let decode = try? JSONDecoder().decode([Card].self, from: data){
                cards = decode
            }
        }
    }
    
    func saveData(){
        if let data = try? JSONEncoder().encode(cards){
            UserDefaults.standard.set(data, forKey: "Cards")
        }
    }
    
    func addCard(){
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAns = newAns.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAns.isEmpty == false else {return}
        
        
        let card = Card(prompt: trimmedPrompt, answer: trimmedAns)
        cards.insert(card, at: 0)
        saveData()
    }
    
    
    func removeCards(at offsets: IndexSet){
        cards.remove(atOffsets: offsets)
        saveData()
    }
    
    
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
