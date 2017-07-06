module ApplicationHelper
  def default_meta_tags
    {
      site: 'さろてきさいころすてーき',
      separator: '|',
      title: 'ホームのページ',
      description: 'ぬるっとしたブログです。中の人はエンジニアです。ぬるっとした内容から技術的な話まで。日々思いついたことを書きつらねます。',
      charset: 'utf-8',
      og: {
        title: 'さろてきさいころすてーき',
        type: 'website',
        url: '',
        image: '',
        site_name: :site,
        description: :description,
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary',
        title: :title,
        description: :description,
        image: {_: "card.png"}
      }
    }
  end
end
