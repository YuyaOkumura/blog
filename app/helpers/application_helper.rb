module ApplicationHelper
  def default_meta_tags
    {
      site: 'さろてきさいころすてーき',
      separator: '|',
      title: 'ホームのページ',
      description: 'さろてきさいころすてーきは、日々考えたことを書き連ねるブログです。技術系の話からくだらない話まで。',
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
