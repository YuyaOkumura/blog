50.times do |i|
  Article.seed_once(:id) do |a|
    a.id = i + 1
    a.user_id = 1
    a.title = "記事 ##{i}"
    a.content = "おすおすおすおす"
    a.is_public = true
  end
end