crumb :root do
  link "Home", root_path
end

crumb :posts do
  link "投稿一覧", posts_path
  parent :root
end

crumb :post_new do
  link "新規投稿", new_post_path
  parent :posts
end

crumb :post do
  post = Post.find(params[:id])
  link "投稿詳細", post_path(post)
  parent :posts
end

crumb :post_edit do
  post = Post.find(params[:id])
  link "投稿編集", edit_post_path(post)
  parent :post
end

crumb :users do
  link "ユーザー一覧", users_path
  parent :root
end

crumb :user_show do
  user = User.find(params[:id])
  link "#{user.nickname}", user_path(user)
  parent :users
end

crumb :user_edit do
  user = User.find(params[:id])
  link "ユーザー編集", edit_user_path(user)
  parent :user_show
end

crumb :user_likes do
  user = User.find(params[:id])
  link "いいね!一覧", likes_user_path(user)
  parent :user_show
end

crumb :user_follows do
  user = User.find(params[:id])
  link "フォロー一覧", follows_user_path(user)
  parent :user_show
end

crumb :user_followers do
  user = User.find(params[:id])
  link "フォロワ一覧", followers_user_path(user)
  parent :user_show
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).