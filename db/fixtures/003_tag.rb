tags = [
  { name: "Rails", slug: "rails" },
  { name: "C", slug: "c" },
  { name: "ロードバランサー", slug: "loadblancer" },
  { name: "JavaScript", slug: "javascript" },
  { name: "PHP", slug: "php" },
  { name: "AWS", slug: "aws" },
  { name: "Mechanize", slug: "mechanize" },
  { name: "sidekiq", slug: "sidekiq" },
  { name: "Gem", slug: "gem" },
  { name: "データベース設計", slug: "database-design" }
]

10.times do |i|
  Tag.seed_once(:id) do |t|
    t.id = i + 1
    t.name = tags[i][:name]
    t.desc = "おすおすおすおす"
    t.slug = tags[i][:slug]
  end
end