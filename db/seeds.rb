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

@project = Project.create(name: "cool project",
                          technologies_used: "cool technologies")

@published = Post.create(title: "The more you ignore him the closer he gets",
                         body: "love, Morrissey",
                         author_id: "1",
                         published: true)

@unpublished = Post.create(title: "there is a light that never goes out",
                           body: "you just lost the morrissey game",
                           author_id: "2",
                           published: false)

@approved_comment_post = Comment.create(body: "this comment IS approved and belongs in posts",
                                   approved: "true",
                                   commentable_id: "1",
                                   commentable_type: "Post")

@unapproved_comment_post = Comment.create(body: "this comment is not approved and belongs in posts",
                                   approved: "false",
                                   commentable_id: "1",
                                   commentable_type: "Post")

@approved_comment_project = Comment.create(body: "this comment IS approved and belongs in projects",
                                   approved: "true",
                                   commentable_id: "1",
                                   commentable_type: "Project")


@unapproved_comment_project = Comment.create(body: "this comment is not approved and belongs in projects",
                                   approved: "false",
                                   commentable_id: "1",
                                   commentable_type: "Project")
