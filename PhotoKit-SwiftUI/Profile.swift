//
//  ContentView.swift
//  PhotoKit-SwiftUI
//
//  Created by Yungui Lee on 5/26/24.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        #if os(macOS)
        ProfileForm()
        #else
        NavigationStack {
            ProfileForm()
        }
        #endif
    }
}

struct ProfileForm: View {
    @StateObject var viewModel = ProfileModel()
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    EditableCircularProfileImage(viewModel: viewModel)
                    Spacer()
                }
            }
            .listRowBackground(Color.clear)
            #if !os(macOS)
            .padding([.top], 10)
            #endif
            Section {
                TextField("First Name", text: $viewModel.firstName, prompt: Text("First Name"))
                TextField("Last Name", text: $viewModel.lastName, prompt: Text("Last Name"))
            }
            Section {
                TextField("About Me", text: $viewModel.aboutMe, prompt: Text("About Me"))
            }
        }
        .navigationTitle("Account Profile")
    }
}

#Preview {
    Profile()
}
