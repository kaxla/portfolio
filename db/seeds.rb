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

@post = Post.create(title: "The more you ignore him the closer he gets",
                    body: "love, Morrissey")

@comment = Comment.create(body: "Every Day is like Sunday",
                          approved: true)
