@editor = User.create(email: "editor@editor.com",
                      password: "password",
                      password_confirmation: "password",
                      role: "editor")

@author = User.create(email: "author@author.com",
                      password: "password",
                      password_confirmation: "password",
                      role: "author")

@user = User.create(email: "user@user.com",
                    password: "password",
                    password_confirmation: "password",
                    role: "user")
