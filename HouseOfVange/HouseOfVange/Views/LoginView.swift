
import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""

    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        
        VStack{
            
            Image("HOV_LOGO2")
            
            Spacer()
            HStack{
                Text("The time to login... is now!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .frame(alignment: .leading)
    
                
            }.padding()
            //                Form{
            TextField("email", text: $email)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
            
            SecureField("Password", text: $password)
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
            
            Button(action: {
                guard !email.isEmpty, !password.isEmpty else {
                    return
                }
                viewModel.signIn(email: email, password: password)
            }, label: {
                Text("Enter House")
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 50)
                    .background(Color.red)
                    .cornerRadius(8)
            })
            
            NavigationLink("Create Account", destination: SignUpView())
                .padding()
            
            Spacer()
        }
        .padding()
        
        Spacer()
    }
}
