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

@published = Post.create(title: "The more you ignore him the closer he gets",
                    body: "love, Morrissey",
                    published:true)

@unpublished = Post.create(title: "there is a light that never goes out",
                           body: "you just lost the morrissey game",
                           published: false)

@comment = Comment.create(body: "Every Day is like Sunday",
                          approved: true)
